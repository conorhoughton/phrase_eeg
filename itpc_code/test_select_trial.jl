
filepath="/home/cscjh/Experiment2/processed_data/ft/"
filename="P5_25_11_2018_trial.dat"

keyFile=Int64[]

open(filepath*filename) do file
    for ln in eachline(file)
        if ln!=""
            push!(keyFile,parse(Int64,ln))
        end
    end
end

println(keyFile)

println(findall(x->x in 0:24, keyFile))

test=rand(150)

println(test)

println(test[findall(x->x in 0:24, keyFile)])
