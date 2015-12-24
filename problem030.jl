
# Find the sum of all the numbers that can be written as the 
# sum of fifth powers of their digits.
function p030(N)
    b = []
    for i = 2:N
        a = sum([parse(Int, j)^5 for j in string(i)])
        if a == i
            push!(b, i)
        end
    end
    println(b)
    println("Sum of fifth digit powers: ", sum(b))
end

@time p030(200000)

