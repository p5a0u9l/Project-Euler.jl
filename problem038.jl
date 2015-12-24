
function p038()
    for i = 9000:9999
        x = redigi(i, 2)
        if ispandigi(x)
            println("x: $x, $(ispandigi(x))")
        end
    end
end

function redigi(n, k)    
    if k == 1
        return n
    else
        return concat(n*k, redigi(n, k - 1))
    end
end

function ispandigi(p)
    d = digits(p);
    if length(d) == 9  && length(unique(d)) == 9 && ~in(0, d)
        return true
    end
    return false
end    

function concat(a, b)
    return parse(Int, "$b$a")
end

@time p038()

