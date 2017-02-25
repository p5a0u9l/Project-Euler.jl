"""
The number, 197, is called a circular prime because all rotations of the
digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100:
    2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
"""

module problem035


function solve()
    N = 1000000
    cnt = 0
    p = primes(N)
    for n in p
        str = string(n)
        has_even = !isempty(intersect("024568", str))
        if !has_even
            a = 1:length(str)
            allprime = true
            for i = 0:length(str) - 1
                t = parse(Int, str[vec(circshift(a, i))])
                if ~isprime(t); allprime = false; break; end
            end
            if allprime
                cnt += 1
                println("Circular prime: $n")
            end
        end
    end
    cnt + 2
end

end
