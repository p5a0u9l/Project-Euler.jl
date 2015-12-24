
function p034()
    f = Dict([i => factorial(i) for i in 0:9])
    result = Set()
    for i = 1:2:50000
        istr = string(i)
        if isempty(intersect("9", istr))
            s = 0
            for j in istr
                s += f[parse(Int, j)]
            end
            if s == i
                println("$i: $s")
                push!(result, i)
            end
        end
    end
    println("Sum is $(sum(result) - 2 - 1)")
end

@time p034()

