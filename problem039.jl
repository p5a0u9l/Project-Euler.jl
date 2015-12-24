
function p039()
    P = pythag_triplets(1000)
    perims = P[:, 4]
#     print(perims .== 120)
    (r, count) = hist(perims, unique(perims))
    println("$count")
    
    max_p = indmax(count)
    println("p = $(max_p) maximizes number of solutions with $(count[max_p])")
#     return count
end

function pythag_triplets(N)
    count = 0
    ptrips = zeros(Int, 200, 4)
    for n = 1:30, m = 1:30
        if m > n
            (a, b, c, p) = euclid(m, n)
            if p <= N
                euc = sort([a, b, c, p])
                if ~in(euc, ptrips)
                    count += 1
                    ptrips[count, :] = euc
                end
            end
        end
    end
    return ptrips[ptrips[:, 1] .!= 0, :]
end

function euclid(m, n)
    a = 2*m*n
    b = m^2 - n^2
    c = m^2 + n^2
    p = a+b+c
    a, b, c, p
end

p = p039() 
