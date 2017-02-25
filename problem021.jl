"""
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The
proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
"""

module problem021
using Primes

"""
adapted from https://rosettacode.org/wiki/Factors_of_an_integer#Julia
"""
function d(n)
    f = [one(n)]
    for (p, k) in factor(n)
        f = reduce(vcat, f, [f*p^j for j in 1:k])
    end
    return sum(f[1:end - 1])
end

function solve()
    amicable_sum = 0
    N = 10000

    # all numbers under N
    numbers = collect(4:N)

    # remove primes from numbers
    filter!(!isprime, numbers)

    # memory
    blist = []

    while !isempty(numbers)
        # remove an element from numbers
        a = pop!(numbers)

        # been there done that
        a in blist && continue

        # apply sum of proper divisors
        b = d(a)

        # false positive condition
        a == b && continue

        # true negative condition
        d(b) != a && continue

        # update memory and amicable_sum
        push!(blist, b)
        amicable_sum += a + b

        # debug print
        false && println("$a, $b")
    end
    amicable_sum
end

end
