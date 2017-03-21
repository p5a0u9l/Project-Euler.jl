"""
Take the number 192 and multiply it by each of 1, 2, and 3:

192 × 1 = 192
192 × 2 = 384
192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576.
We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by
1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the
concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?
"""

module problem038
include("lib.jl")

function redigi(n, k)
    if k == 1
        return n
    else
        return concat(n*k, redigi(n, k - 1))
    end
end

function concat(a, b)
    return parse(Int, "$b$a")
end

function solve()
    for i = 9000:9999
        x = redigi(i, 2)
        if lib.pandigital(x)
            lib.debug("x: $x")
        end
    end
end

end
