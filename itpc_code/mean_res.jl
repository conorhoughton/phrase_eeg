
function meanResultant(a)
    dropdims(abs.(sum(a,dims=1)./size(a)[1]),dims=1)
end

function circularMeasures(a)
    r=dropdims(sum(a,dims=1)./size(a)[1],dims=1)
    (angle.(r),abs.(r))
end
    

function circularVariance(a)
    -2*log.(meanResultant(a))
end


# this is the bias corrected (mean resultant) squared from
# Kutil, Rade. "Biased and unbiased estimation of the circular mean resultant length and its variance." Statistics 46.4 (2012): 549-561.

function biasCorrect(a)
    (dropdims(abs.(sum(a,dims=1).^2/size(a)[1]),dims=1)-ones(Float64,size(a)[2:3]))/(size(a)[1]-1)
end

