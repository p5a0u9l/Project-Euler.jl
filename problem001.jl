# Problem 001
function p001(N)
    s = 0
    for i = 1:N - 1
        if (i % 3 == 0) | (i % 5 == 0); s += i; end
    end; s
end

@time p001(1000)


