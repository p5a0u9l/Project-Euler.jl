
# Problem 002
function p002(N)
    s = b = 2; a = 1; c = 3
    while c <= N
        a = b; b = c; c = a + b
        if c % 2 == 0; s += c; end
    end; s
end

@time p002(4e6)

