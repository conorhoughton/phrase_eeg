

using Random

n=20

data=Array{Tuple{Int64,Float64}}(undef,n)

for i in 1:n
    data[i]=(i,rand(Float64))
end

print(data)

order=[x[1] for x in sort(data, by = x->x[2])]

println(order)
    
