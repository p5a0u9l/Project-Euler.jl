# Problem 003
# What is the largest prime factor of the number 600851475143 ?
function p003(N)
    maxPrime = 0
    for i::Int64 = 2:round(sqrt(N))
#         println(N)
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

@time p003(600851475143)

