#!/usr/local/bin/julia

N = 4e6
function p002()
    s = b = 2; a = 1; c = 3
    while c <= N
        a = b; b = c; c = a + b
        if c % 2 == 0; s += c; end
    end
    s
    println("The sum of the even-valued terms of the Fibonacci sequence whose ")
    println("values do not exceed $N is $s")
end

@time p002()

