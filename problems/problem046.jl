"""
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
"""

module problem046
using Primes

"""
solve  N = P + 2x^2 for x, for some odd composite N and some prime P
x = √(N - P)/√(2)
x^2 = (N - P)/2
"""

SQRT2 = √2 # compute once
solve_for_x(N, P) = sqrt(N - P)/SQRT2
isinteger(x) = abs(round(Int64, x) - x) < 1e-8

""" search the primes < N  for integer solutions to x """
function test_conjecture(N; doprint=false)
    for p0 in primes(N)
        x = solve_for_x(N, p0)
        isinteger(x) && return true
        doprint && println("$N = $p0 + 2 * $x^2")
    end
    return false
end

function solve()
    n = 33
    while isprime(n) || test_conjecture(n)
        n += 2
    end
    n
end

end
