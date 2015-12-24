
function p035(N)
    count = 0
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
                count += 1
                println("Circular prime: $n")
            end
        end
    end
    println("Circular prime count is $(count + 2)")
end

@time p035(1000000)

