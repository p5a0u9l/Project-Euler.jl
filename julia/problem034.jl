"""
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
"""

module problem034

function solve()
    f = Dict([i => factorial(i) for i in 0:9])
    result = Set()
    for i = 1:2:50000
        istr = string(i)
        if isempty(intersect("9", istr))
            s = 0
            for j in istr
                s += f[parse(Int, j)]
            end
            if s == i
                println("$i: $s")
                push!(result, i)
            end
        end
    end
    sum(result) - 2 - 1
end

end
