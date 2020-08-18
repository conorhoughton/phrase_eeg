
include("load.jl")
include("mean_res.jl")

filename_path="/home/cscjh/Experiment2/data/"
filename_file="file_list.txt"

lines=readlines(filename_path*filename_file)

filepath="/home/cscjh/Experiment2/processed_data/ft/"
filename_extra="_fg.dat"
filename_trial="_trial.dat"

itpc=zeros(Float64,58)

for line in lines

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

    bigA=phase(condPhase["anan"])
    
    #    itpc+=dropdims(sum(meanResultant(bigA[2]),dims=1)/size(bigA[2])[2],dims=1)
    itpc+=dropdims(sum(biasCorrect(bigA[2]),dims=1)/size(bigA[2])[2],dims=1)

end
    
for x in itpc
    println(x)
end


