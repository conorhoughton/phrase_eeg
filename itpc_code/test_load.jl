
include("load.jl")

filepath="/home/cscjh/Experiment2/processed_data/ft/"
filename="P5_25_11_2018_fg.dat"

itpc=phase(filepath*filename)

println(typeof(itpc))

itpc=condition(filepath*filename)

println(typeof(itpc))

