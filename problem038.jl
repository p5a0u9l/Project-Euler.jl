#!/usr/local/bin/julia

# Problem Statement
println("Take the number 192 and multiply it by each of 1, 2, and 3:")
println()
println("192 × 1 = 192")
println("192 × 2 = 384")
println("192 × 3 = 576")
println()
println("By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)")
println()
println("The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).")
println()
println("What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?\n\n")

# Solution
function p038()
    for i = 9000:9999
        x = redigi(i, 2)
        if ispandigi(x)
            println("x: $x, $(ispandigi(x))")
        end
    end
end

function redigi(n, k)    
    if k == 1
        return n
    else
        return concat(n*k, redigi(n, k - 1))
    end
end

function ispandigi(p)
    d = digits(p);
    if length(d) == 9  && length(unique(d)) == 9 && ~in(0, d)
        return true
    end
    return false
end    

function concat(a, b)
    return parse(Int, "$b$a")
end

@time p038()

