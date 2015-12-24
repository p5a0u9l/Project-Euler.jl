#!/usr/local/bin/julia
#Problem Statement
println("The number 3797 has an interesting property. Being prime itself, it is ")
println("possible to continuously remove digits from left to right, and remain ")
println("prime at each stage: 3797, 797, 97, 7. Similarly we can work from right ")
println("to left: 3797, 379, 37, and 3.")
println("\nFind the sum of the only eleven primes that area both truncatable from ")
println("left to right and right to left\n\n")

# Solution
function p037(N)
    p = primes(N)[5:end] # skip single digit primes
    evens = [0, 2, 4, 6, 8]
    s = c = 0;
    for n in p
        a = digits(n)
        if n > 99 # only 3 digits and greater
            if ~isempty(intersect(a, evens)); continue; end
        end
        tprime = true
        for i = 0:length(a)-2
            if ~isprime(getnum(a[1:i+1])) || ~isprime(getnum(a[end-i:end]))    
                 tprime = false; continue; 
            end
        end
        if tprime
            println("Truncatable: $s")
            s += n; c += 1;
        end
    end
    println("Sum of $c truncatable primes is $s")
end

function getnum(num_array)
    sum([num_array[k]*10^(k-1) for k=1:length(num_array)])
end

@time p037(1000000)
