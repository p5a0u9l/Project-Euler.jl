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

"""
1 digit multiplicand requires 4 digit multiplier
1*1000 = 1000 => 9 digits
8*1249 = 9992 => 9 digits
9*1111 = 9999 => 9 digits

2 digit multiplicand requires 3 digit multiplier

due to commutivity, 3/4 digit multiplicands duplicate search space
"""

function ispandigi(str)
    return !contains(str, "0") && length(str) == 9 && allunique(str)
end

function solve()
    result = Set()
    # split a iterators into 1/2 digit multiplicand components
    a_iter = [1:9, 10:99]
    b_iter = [[1000:floor(Int, 9999/a) for a in a_iter[1]],
              [100:floor(Int, 999/a) for a in a_iter[1]]]

    for i = [1, 2]
        for a in a_iter[i]
            for b in b_iter[i][a_iter[1][digits(a)[i]]]
                a*b in result && continue
                if ispandigi(@sprintf("%d%d%d", a, b, a*b))
                    push!(result, a*b)
                end
            end
        end
    end
    sum(result)
end

end
