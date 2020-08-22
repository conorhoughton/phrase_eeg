
# this is the programme that does all the work
# it loads the big matrices of Fourier coefficients
# organizes them into a dictionary that can be used to make matrices and vectors
# it uses these to do the stats
# and output files for plotting


using HypothesisTests

include("general.jl")
include("mean_res.jl")
include("confidence.jl")

function mWTest(condHigher::Int64,condLower::Int64,allITPC,frequencyI,p::Float64)
    statTest(MannWhitneyUTest,condHigher,condLower,allITPC,frequencyI,p)
end


function signTest(condHigher::Int64,condLower::Int64,allITPC,frequencyI,p::Float64)
    statTest(SignTest,condHigher,condLower,allITPC,frequencyI,p)
end


function statTest(test,condHigher::Int64,condLower::Int64,allITPC,frequencyI,p::Float64)
    a=allITPC[:,condHigher,frequencyI]
    b=allITPC[:,condLower ,frequencyI]
    this_p=pvalue(test(a,b),tail=:right)
    if this_p<p
        (true,this_p)
    else
        (false,this_p)
    end
    
end

filename_path="/home/cscjh/Experiment2/data/"
filename_file="file_list_full.txt"

lines=readlines(filename_path*filename_file)

filepath="/home/cscjh/Experiment2/processed_data/ft/"
filename_extra="_ft.dat"
filename_trial="_trial.dat"
freqFile="freq.txt"

participantN=20 # number of participants
frequencyN=58
stimuli=getStimuli()
stimuliP1to4=getStimuliP1to4()
stimuliN=length(stimuli)
trialsN=24


allITPC=zeros(Float64,participantN,stimuliN,frequencyN)

for (participantI,line) in enumerate(lines)

    global allITPC
    
    nameRoot=strip(line)

    filename=filepath*nameRoot*filename_extra
    
    keyFile=Int64[]
    
    open(filepath*nameRoot*filename_trial) do file
        for ln in eachline(file)
            if ln!=""
                push!(keyFile,parse(Int64,ln))
            end
        end
    end

    #---------load the matrix of Fourier coefficients
    if participantI<5
        condPhase=conditionP1to4(filename,keyFile)
    else
        condPhase=conditionP5to20(filename,keyFile)
    end
            
    #--------normal itpc

    # dispersion=biasCorrect
    dispersion=meanResultant
    #  dispersion=circularVariance
    
    if participantI<5
        for (stimulusI,stimulus) in enumerate(stimuliP1to4) 
            bigA=phase(condPhase[stimulus])
            allITPC[participantI,stimulusI+3,:]=dropdims(sum(dispersion(bigA[2]),dims=1)/size(bigA[2])[2],dims=1)
        end
    else 
        for (stimulusI,stimulus) in enumerate(stimuli) 
            bigA=phase(condPhase[stimulus])
            allITPC[participantI,stimulusI,:]=dropdims(sum(dispersion(bigA[2]),dims=1)/size(bigA[2])[2],dims=1)
        end
    end


    
end


#----------------- load frequency file

frequencies=Float64[]

open(filepath*freqFile) do file
        for ln in eachline(file)
            if ln!=""
                push!(frequencies,parse(Float64,ln))
            end
        end
end


stimulusI=3
#participant0=1
participant0=5


#--------------- print ICTP grand average

printGrandAverage=false
#printGrandAverage=true

if printGrandAverage

    grandAverage=dropdims(sum(allITPC,dims=1),dims=1)/(participantN-participant0+1)

    for f in 1:frequencyN
        println(frequencies[f]," ",grandAverage[stimulusI,f])
    end

end

#--------------- print ICTP - all

#printAll=true
printAll=false

if printAll

    for f in 1:frequencyN
        print(frequencies[f]," ")
        for participantI in participant0:participantN
            print(allITPC[participantI,stimulusI,f]," ")
        end
        print("\n")
    end

end


#------------------ find significant peaks

grammar=getGrammarPeaks()
grammarIndices=Int64[]

for g in grammar
    push!(grammarIndices,findfirst(frequencies.==g))
end

#println(grammarIndices)

#----------------- examine the behaviour with the null ITPC vector

testCompareToNull=false


if testCompareToNull

    #stimulusI=6
    
    # for pointsN in 1000:1000:30000
    
    #     nullITPC=randomITPC(pointsN,trialsN,participantN)

    #     print(pointsN," ")
    #     for g in grammarIndices
    #         p=pvalue(MannWhitneyUTest(allITPC[:,stimulusI,g],nullITPC),tail=:right)
    #         print(" ",p)
    #     end
    #     print("\n")
    # end


    pointsN=5000

    nullITPC=randomITPC(pointsN,trialsN,participantN)
    
    for f in 1:frequencyN
        print(f,"  ",frequencies[f])
        for s in 4:6
            p=pvalue(MannWhitneyUTest(allITPC[:,s,f],nullITPC),tail=:right)
            print(" ",p)
        end
        print("\n")
    end
end

# ---------------------- find significant peaks

findSignificantPeaks=true

if findSignificantPeaks
    
    pointsN=10000

    nullITPC=randomITPC(pointsN,trialsN,participantN)

    
    f=grammarIndices[1]
    
    println("sentence")
    print("advp ")
    println(pvalue(MannWhitneyUTest(allITPC[5:20,1,f],nullITPC),tail=:right))
    print("rrrr ")
    println(pvalue(MannWhitneyUTest(allITPC[5:20,2,f],nullITPC),tail=:right))
    print("rrrv ")
    println(pvalue(MannWhitneyUTest(allITPC[5:20,3,f],nullITPC),tail=:right))
    print("avav ")
    println(pvalue(MannWhitneyUTest(allITPC[:,4,f],nullITPC),tail=:right))
    print("anan ")
    println(pvalue(MannWhitneyUTest(allITPC[:,5,f],nullITPC),tail=:right))
    print("phmi ")
    println(pvalue(MannWhitneyUTest(allITPC[:,6,f],nullITPC),tail=:right))

    
    f=grammarIndices[2]
    
    println("\nphrase")
    print("rrrr ")
    println(pvalue(MannWhitneyUTest(allITPC[5:20,2,f],nullITPC),tail=:right))
    print("avav ")
    println(pvalue(MannWhitneyUTest(allITPC[:,4,f],nullITPC),tail=:right))
    print("anan ")
    println(pvalue(MannWhitneyUTest(allITPC[:,5,f],nullITPC),tail=:right))
    print("phmi ")
    println(pvalue(MannWhitneyUTest(allITPC[:,6,f],nullITPC),tail=:right))

    f=grammarIndices[4]
    
    println("\nsyllable")
    print("rrrr ")
    println(pvalue(MannWhitneyUTest(allITPC[5:20,2,f],nullITPC),tail=:right))
    print("avav ")
    println(pvalue(MannWhitneyUTest(allITPC[:,4,f],nullITPC),tail=:right))
    print("anan ")
    println(pvalue(MannWhitneyUTest(allITPC[:,5,f],nullITPC),tail=:right))
    print("phmi ")
    println(pvalue(MannWhitneyUTest(allITPC[:,6,f],nullITPC),tail=:right))

end

# ---------------------- compare phrase peaks 


comparePhrasePeaks=true

if comparePhrasePeaks

    ourStimuli=stimuli[[2,4,5,6]]
    
    pointsN=10000

    nullITPC=randomITPC(pointsN,trialsN,participantN)

    f=grammarIndices[2]

    testVectors=Dict("rrrr"=>allITPC[5:20,2,f],"avav"=>allITPC[:,4,f],"anan"=>allITPC[:,5,f],"phmi"=>allITPC[:,6,f])

    println("\npairwise")

    for i in 1:4
        for j in i+1:4
            print(ourStimuli[i]," v ",ourStimuli[j]," ")
            if i==1
                println( pvalue(SignTest(testVectors[ourStimuli[i]],testVectors[ourStimuli[j]][5:20]),tail=:both))
            else
                println( pvalue(SignTest(testVectors[ourStimuli[i]],testVectors[ourStimuli[j]]),tail=:both))
            end
        end
    end

    println("\nKruskalWallis")
    println(pvalue(KruskalWallisTest(testVectors["rrrr"],testVectors["avav"],testVectors["anan"],testVectors["phmi"])))
    
end
