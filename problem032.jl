"""
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity
can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only
include it once in your sum.
"""

module problem032

function pandigital(a, b)
    tmp = a*b
    p = 0
    str = string(string(tmp), string(a), string(b))
    if length(str) == 9
        if length(unique(str)) == 9
            if search(str, '0') == 0
                p = tmp
#                 println("$a*$b = $p")
            end
        end
    end
    p
end

function solve()
    result = []
    for a = 1:99
        for b = 100:2000
            p = pandigital(a, b)
            if p > 0
                push!(result, p)
            end
        end
    end
    result = sum(unique(result))
    result
end

end
