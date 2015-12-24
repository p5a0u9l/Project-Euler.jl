
function p036(N)
    s = 0
    for n = 1:N
        d = string(n)
        b = bin(n)
        if reverse(d) == d && reverse(b) == b
            s += n
#             println("Palindromic: $d, $b")
        end
    end
    println("Sum is $s")
end

@time p036(1000000)
