#!/usr/local/bin/julia

println("What is the sum of the numbers on the diagonals in a ")
println("1001 by 1001 spiral formed in the same way?")

function p028(N)
    direction = [[0 1]; [+1 0]; [0 -1]; [-1 0]; [0 1]]
    A = zeros(Int64, N, N)
    r = c = round(Int, (N-1)/2 + 1) 
    i = 1
    A[r, c] = i
    for s = 1:2:N-1
        distance = [1, s, s+1, s+1, s+1]
        for j = 1:5
            d = distance[j]
            for k = 1:d
                r += direction[j, 1]
                c += direction[j, 2]
                i += 1
                A[r, c] = i
            end
        end
    end
    result = sum(diag(A)) + sum(diag(rotr90(A))) - 1
    println("Sum of diagonals: $result")
end

@time p028(31)

