"""
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?
"""

module problem003
using Primes

function solve()
    N = 600851475143
    iter = collect(2:round(Int, sqrt(N)))
    filter!(x -> N % x == 0, iter)
    max_prime = 0
    for i in iter
        k = div(N, i)
        if i > max_prime && isprime(i)
            max_prime = i
        end
        if k > max_prime && isprime(k)
            max_prime = k
        end
    end
    max_prime
end

end
