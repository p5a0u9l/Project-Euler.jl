
function p032()
    result = []
    for a = 1:99
        for b = 100:2000
            p = pandigital(a, b)
            if p > 0
                push!(result, p)
            end
        end        
    end
    result = sum(unique(result))
    println("Sum of products: $result")
end

function pandigital(a, b)
    tmp = a*b
    p = 0
    str = string(string(tmp), string(a), string(b))
    if length(str) == 9 
        if length(unique(str)) == 9
            if search(str, '0') == 0
                p = tmp
#                 println("$a*$b = $p")
            end
        end
    end
    p
end    
    

@time p032()
