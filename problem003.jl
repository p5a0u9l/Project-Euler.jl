"""
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143?
"""

module problem003

function solve()
    N = 600851475143
    maxPrime = 0
    for i::Int64 = 2:round(sqrt(N))
        if N % i == 0
            k = div(N, i)
            if isprime(i)
                if i > maxPrime
                    maxPrime = i
                end
            end
            if isprime(k)
                if k > maxPrime
                    maxPrime = k
                end
            end
        end
    end
    maxPrime
end

end
