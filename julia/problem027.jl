"""
Euler discovered the remarkable quadratic formula:
    n^2 + n + 41

It turns out that the formula will produce 40 primes for the consecutive
integer values 0≤n≤39.

However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 divisible by 41,
and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.

The incredible formula
    n^2 − 79n + 1601

was discovered, which produces 80 primes for the consecutive values 0≤n≤79.
The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n^2 + an + b, where |a|<1000 and |b|≤1000

Find the product of the coefficients, a and b, for the quadratic expression
that produces the maximum number of primes for consecutive values of n,
starting with n=0
"""

module problem027
using Primes

quadratic_prime(a::Int, b::Int, n::Int) = n^2 + a*n + b

"""
strategy:
    1.  when n=0, we have 0 + 0 + b is prime and so conclude that b must
        be prime for all n.
    2.  when n=1, we have 1 + a + b is prime. Since b is prime, it is also odd.
        Now, adding two odd numbers givens an even number, so 1 + a is even,
        and we conclude that a is odd for all n.
"""
function count_primes(a, b)
    n::Int = 0
    while isprime(quadratic_prime(a, b, n))
        n += 1
    end
    n
end

function solve()
    n_max = 0
    result = -1
    a_iterator = -999:2:999
    b_iterator = collect(a_iterator)
    filter!(isprime, b_iterator)
    for a in a_iterator
        for b in b_iterator
            n = count_primes(a, b)
            if n > n_max
                n_max = n
                result = a*b
                #= println("n^2 + $a*n + $b yields $n primes") =#
            end
        end
    end
    result
end

end
