"""
Starting with the number 1 and moving to the right in a clockwise direction a
5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
formed in the same way?
"""

module problem028

function solve()
    N = 1001
    direction = [
                 [0 +1];
                 [+1 0];
                 [0 -1];
                 [-1 0];
                 [0 +1]]
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
    # sum both diagonals (remove duplicated center = 1)
    result = sum(diag(A)) + sum(diag(rotr90(A))) - 1
    result
end

end
