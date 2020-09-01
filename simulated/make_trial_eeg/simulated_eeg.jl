
keyDictionaryLocation="./keyDictionary/"::String
trialLocation="./trials/"::String
vectorLocation="./vectors/"::String

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

    trial

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
        println("line not found in ",name)
    end

    frankVector
    
end

function makeTrialResponse(repeatN::Int64,trialName::String,keys,electrodes::Vector{Int64})

    trial=loadTrial(trialName,keys)
    trialN=length(trial)

    electrodeN=length(electrodes)

    response=zeros(Float64,electrodeN,trialN*repeatN)

    for (wordC,word) in enumerate(trial)
        thisVector=loadVector(word[2],word[1])
        for repeatC in 1:repeatN
            for (i,e) in enumerate(electrodes)
                response[i,(wordC-1)*repeatN+repeatC]=thisVector[e]
            end
        end
    end

    response

end

function makeConditionResponse(repeatN::Int64,condition::String,keys,electrodes::Vector{Int64})

    conditionFiles=Dict{String,String}("rrrr"=>"rrrr_","avav"=>"AVAV_","anan"=>"ANAN_","phmi"=>"phrase_mix_")
    
    fileName=condition*".txt"
    
    open(fileName) do file
        for line in eachline(file)
            if strip(line) !=""
                trialNumber=strip(split(line)[1])
                trialName=conditionFiles[condition]*trialNumber*".txt"
                makeTrialResponse(repeatN,trialName,keys,electrodes)
            end
        end
    end
    
end




keys=loadKeyDictionary()

#println(keys)

#println(loadTrial("ANAN_33.txt",keys))

#println(loadVector("mass_nouns",8))

#println(size(makeTrialResponse(320,"ANAN_33.txt",keys,[3,12,45])))

makeConditionResponse(320,"rrrr",keys,[3,12,45])
