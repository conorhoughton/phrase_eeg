
using HypothesisTests

a=rand(10)+0.25*ones(10)
b=rand(10)-0.25*ones(10)

println(a)
println(b)

println(pvalue(MannWhitneyUTest(a,b),tail=:right))
