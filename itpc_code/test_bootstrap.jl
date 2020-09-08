
using Random
using Distributions
using Statistics

function meanResultant(phases)
    abs(mean(phases))
end
    
pointN=20

outlierP=0.1

a0=collect(0.1:0.1:3.1)

trialN=100
bootstrapN=100

for a in a0

    phases=zeros(Complex{Float64},pointN)
    direct=Float64[]

    for trialC in 1:trialN
    
        for i in 1:pointN
            if rand(Float64)<outlierP
                phases[i]=exp(im*rand(Uniform(-a,a)))
            else
                phases[i]=exp(im*rand(Float64))
            end
        end

        push!(direct,meanResultant(phases))

    end
    print(a," ",mean(direct)," ",std(direct)," ")
    
    bootstrapMeanR=Float64[]

    for i in 1:bootstrapN
        newPhases=zeros(Complex{Float64},pointN)
        for pointC in 1:pointN
            newPhases[pointC]=phases[rand(1:pointN)]
        end
        push!(bootstrapMeanR,meanResultant(newPhases))
    end

    println(mean(bootstrapMeanR)," ",std(bootstrapMeanR))


end

