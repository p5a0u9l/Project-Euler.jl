"""
Find the product of the coefficients, a and b, for the quadratic expression that produces the
maximum number of primes for consecutive values of n, starting with n = 0.
"""

module problem027

function solve(N)
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
                return ab
            end
        end
    end
end

end
