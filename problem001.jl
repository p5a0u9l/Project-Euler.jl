#!/usr/local/bin/julia

N = 5000

function p001()
    s = 0
    for i = 1:N - 1
        if (i % 3 == 0) | (i % 5 == 0); s += i; end
    end
    println("The sum of all the multiples of 3 or 5 below $N is $s")
end

@time p001()
