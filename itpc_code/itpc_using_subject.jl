
# depreciated - replaced by itpc_by_subject.jl

using HypothesisTests

include("general.jl")
include("mean_res.jl")


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
filename_file="file_list.txt"

lines=readlines(filename_path*filename_file)

filepath="/home/cscjh/Experiment2/processed_data/ft/"
filename_extra="_fg.dat"
filename_trial="_trial.dat"
freqFile="freq.txt"

participantN=16 # number of participants
frequencyN=58
stimuli=getStimuli()
stimuliN=length(stimuli)
electrodeN=32
trialN=25

allSummand=zeros(Complex,trialN,electrodeN,stimuliN,frequencyN)

for (participantI,line) in enumerate(lines)

    global itpc

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
    
    condPhase=condition(filename,keyFile)

    for (stimulusI,stimulus) in enumerate(stimuli) 
        bigA=phase(condPhase[stimulus])
        allSummand[:,:,stimulusI,:]+=bigA[2]
    end
    
end




# [trial , stimulus, freq]
allITPC=dropdims(sum(abs.(allSummand)./participantN,dims=2)./electrodeN,dims=2)



# #----------------- load frequency file

frequencies=Float64[]

open(filepath*freqFile) do file
        for ln in eachline(file)
            if ln!=""
                push!(frequencies,parse(Float64,ln))
            end
        end
end


# -------------- print out ITCP v freq
stimulusI=5 # anan
for i in 1:frequencyN
    println(frequencies[i]," ",sum(allITPC[:,stimulusI,i])/electrodeN)
end

# #------------------ find significant peaks

# grammar=getGrammarPeaks()
# grammarIndices=Int64[]

# for g in grammar
#     push!(grammarIndices,findfirst(frequencies.==g))
# end

# println(grammarIndices)

# #consider all frequencies except those within excludeBand of the grammar locations
# excludeBand=0::Int64

# excludeIndices=[]
# for i in -excludeBand:excludeBand
#     for grammarIndex in grammarIndices
#         push!(excludeIndices,grammarIndex+i)
#     end
# end

# println(excludeIndices)

# includeIndices=[!(i in excludeIndices) for i in 1:frequencyN]

# nullValues=vec(allITPC[:,:,includeIndices])

# # rrrr is stimulus 2
# for stimulusI in 1:stimuliN
#     println("\n",stimuli[stimulusI])
#     for frequency in grammar
#         frequencyI=findfirst(frequencies.==frequency)
#         p=pvalue(MannWhitneyUTest(allITPC[:,stimulusI,frequencyI],nullValues),tail=:right)
#         print(p," ")
#     end
# end

# println()
    


    

