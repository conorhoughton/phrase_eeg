
# this makes the eeg based on the Frank vectors
# a lot of it is book keeping
# it loads files "rrrr.txt" and similar
# that list the trials, in the trial files
# there are lists of words, it then finds the corresponding
# Frank vectors

# the Frank vectors are 300 long so 32 components are picked
# to act as "electrodes"

using Statistics
using Random
using StatsBase
using FFTW
using MAT
using CorrNoise

keyDictionaryLocation="./keyDictionary/"::String
trialLocation="./trials/"::String
vectorLocation="./vectors/"::String

function getConditionFiles()

    Dict{String,String}("rrrr"=>"rrrr_","avav"=>"AVAV_","anan"=>"ANAN_","phmi"=>"phrase_mix_")

end
    
function loadKeyDictionary()
    fileNamesFile=keyDictionaryLocation*"file_names.txt"

    fileNames=String[]
    
    open(fileNamesFile) do file
        for line in eachline(file)
            if strip(line) != ""
                push!(fileNames,strip(line))
            end
        end
    end

    keys=Dict()

    for fileName in fileNames
        fullFileName=keyDictionaryLocation*fileName*".txt"
        open(fullFileName) do file
            for (i,line) in enumerate(eachline(file))
                if strip(line) !=""
                    keys[strip(line)]=[i,fileName]
                end
            end
        end
    end
    
    keys
    
end

function loadTrial(fileName::String)

    trial=String[]
    fullFileName=trialLocation*fileName

    open(fullFileName) do file
        for line in eachline(file)
                if strip(line) !=""
                    push!(trial,strip(line))
                end
        end
    end
#    trial
    shuffle(trial)

end

function loadTrial(filename::String,keys)

    trial=loadTrial(filename)

    trialLocation=[]

    for word in trial
        location=get(keys,word,"f/p")
        if location == "f/p"
            println(word," not a word not in keys f/p")
        end
        push!(trialLocation,location)
    end

    trialLocation

end

function loadVector(name::String,lineNumber::Int64)

    fullFileName=vectorLocation*name*".txt"

    foundLine=false

    frankVector=Float64[]
    
    open(fullFileName) do file
        for (i,line) in enumerate(eachline(file))
            if i==lineNumber
                if strip(line) !=""
                    foundLine=true
                    frankVector=[parse(Float64,x) for x in split(line,",")]
                end
            end
        end
    end

    if !foundLine
        println("f/p line not found in ",name)
    end

    frankVector
    
end

function makeTrialResponse(repeatN::Int64,trialName::String,keys,electrodes::Vector{Int64},word0)

    # function filter(i)
    #     x=2*pi*(i-repeatN/2)/repeatN
    #     if x!=0
    #         sin(x)/x
    #     else
    #         1.0
    #     end
    # end

    function filter(i)
        sin(pi*i/repeatN)
    end

    # function filter(i)
    #     1.0
    # end


    # function filter(i::Int64)
    #     x=(i-repeatN/2)/repeatN
    #     exp(-x^2)
    # end
            
    trial=loadTrial(trialName,keys)
    trialN=length(trial)-word0

    electrodeN=length(electrodes)

    response=zeros(Float64,electrodeN,trialN*repeatN)

    for (wordC,word) in enumerate(trial)
        if wordC > word0
            thisVector=loadVector(word[2],word[1])
            #thisVector=2.0*rand(Float64,electrodeN)-ones(Float64,electrodeN)
            #for e in thisVector
            #    print(e," ")
            #end
            #println()
            for repeatC in 1:repeatN
                for (i,e) in enumerate(electrodes)
                    response[i,(wordC-1-word0)*repeatN+repeatC]=thisVector[e]*filter(repeatC)
                end
            end
        end
    end

    response

end


function loadTrials(condition::String)

    conditionFiles=getConditionFiles()
    
    fileName=condition*".txt"
    
    trials=String[]
    
    open(fileName) do file
        for line in eachline(file)
            if strip(line) !=""
                trialNumber=strip(split(line)[1])
                trialName=conditionFiles[condition]*trialNumber*".txt"
                push!(trials,trialName)
            end
        end
    end

    trials

end
    
# this was used to do the Fourier transform directly; I changed to exporting the responses
# and running them through the same Fourier code as the real data
# this is just for consistiency 
# the answer is largely unchanged, the peaks are broader from Fieldtrip because of the taper
# anyway since I haven't been using this it probably doesn't work anymore since I started
# adding the noise.

function makeFourierResponse(repeatN::Int64,condition::String,keys,electrodes::Vector{Int64},freqN,freq0,word0,eta)

    freq1=freq0+freqN-1

    trials=loadTrials(condition)

    trialN=length(trials)
    
    bigA=zeros(Complex{Float64},electrodeN,trialN,freqN)

    for (trialC,trialName) in enumerate(trials)
        littleA=makeTrialResponse(repeatN,trialName,keys,electrodes,word0)        
        littleA=littleA.+eta*randn(size(littleA))
        bigA[:,trialC,:]=fft(littleA,2)[:,freq0:freq1]
    end

    bigA
    
end

#note that response has the indicies in a different order to fourierResponse!
#should fix this!

function makeResponse(repeatN::Int64,condition::String,keys,electrodes::Vector{Int64},word0,eta)

    trials=loadTrials(condition)

    exampleTrial=loadTrial(trials[1],keys)
    wordN=length(exampleTrial)-word0

    electrodeN=length(electrodes)
    
    trialN=length(trials)
    
    response=zeros(Float64,trialN,electrodeN,repeatN*wordN)

    for (trialC,trialName) in enumerate(trials)
        pinkNoise=OofRNG(GaussRNG(MersenneTwister(rand(UInt64))), -0.75, 1.15e-5, 0.01, 1000.0)
        trialResponse=makeTrialResponse(repeatN,trialName,keys,electrodes,word0)
        response[trialC,:,:]=trialResponse
        for t in 1:repeatN*wordN
            r=randoof(pinkNoise)
            for e in 1:electrodeN
                response[trialC,e,t]+=eta*r
            end
        end
    end

    response
    
end

function simpleCoeff(condition::String,keys,electrodes::Vector{Int64},word0)

    a=0.3411 #this is the magic number that gives a uniformly selected x the same std as the word coeffs

    sigma=0.1969 # I now realise it's normal
    
    trials=loadTrials(condition)

    electrodeN=length(electrodes)

    coeff=zeros(Float64,electrodeN)

    for (trialC,trialName) in enumerate(trials)
        
        trial=loadTrial(trialName,keys)

        trialCoeff=zeros(Float64,electrodeN)
        
        for (wordC,word) in enumerate(trial)
            if wordC > word0
                thisVector=loadVector(word[2],word[1])
                #thisVector=2*a*rand(Float64,electrodeN)-a*ones(Float64,electrodeN)
                #thisVector=sigma*randn(Float64,electrodeN)
                trialCoeff+=thisVector*(-1)^wordC
            end
        end
        coeff+=abs.(trialCoeff)
        
    end

    sum(abs.(coeff))
    
end

    


function phase(bigA)

    phases=bigA./(abs.(bigA))
    phases

end


function meanResultant(a)
    dropdims(abs.(sum(a,dims=2)./size(a)[2]),dims=2)
end


function electrodeVector(frankN::Int64, electrodeN::Int64)
    sample(collect(1:frankN),electrodeN;replace=false, ordered=true)
end


keys=loadKeyDictionary()

electrodeN=300
frankN=300
word0=4

#electrodes=electrodeVector(frankN,electrodeN)

#println(keys)

#println(loadTrial("ANAN_33.txt",keys))

#println(loadVector("mass_nouns",8))

#println(size(makeTrialResponse(320,"ANAN_33.txt",keys,[3,12,45])))

#makeConditionResponse(320,"rrrr",keys,[3,12,45])

#phases=phase(makeFourierResponse(320,"anan",keys,electrodes,58,3,4,0.01))

#itpc=meanResultant(phases)

#averageItpc=sum(itpc,dims=1)/size(itpc)[1]

#for a in averageItpc
#    println(a)
#end

condition="rrrr"

eta=0.5


#response=makeResponse(320,condition,keys,collect(1:300),4,eta)

#file = matopen(condition*"_response.mat", "w")
#file = matopen("random"*"_response.mat", "w")
#write(file, "response", response)
#close(file)

#testN=10
#test=Float64[]
#for i in 1:testN
#   push!(test,simpleCoeff(condition,keys,collect(1:300),word0))
#end

#println(mean(test)," ",std(test))

#sort!(test)

#println(test[Int64(0.95*testN)]," ",test[Int64(0.05*testN)])

conditions=["rrrr","avav","phmi","anan"]

for condition in conditions
    println(condition," ",simpleCoeff(condition,keys,collect(1:300),word0))
end
