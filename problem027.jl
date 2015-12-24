#!/usr/local/bin/julia

function p027(N)
    nMax = 0
    for a = -N+1:0
        for b = 0:N-1
            n = 0
            while true
                if isprime(n.^2 + a*n + b); 
                    n += 1; 
                else; 
                    break; 
                end
            end
            if n > nMax
                nMax = n
                println("a: $a, b: $b, ab: $(a*b), n: $nMax")
            end
        end
    end
end

#Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
@time p027(1000)
