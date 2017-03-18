"""
Consider all integer combinations of ab for 2 ≤ a ≤ 5 and 2 ≤ b ≤ 5:

If they are placed in numerical order, with any repeats removed, we get
the following sequence of 15 distinct terms:

4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

How many distinct terms are in the sequence generated by ab for
2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?
"""

module problem029

function solve()
    N = 100
    A = zeros(BigInt, N-1, N-1)
    for a = 2:N
        for b = 2:N
            A[a-1, b-1] = BigInt(a)^b
        end
    end
    result = length(unique(A))
    result
end

end
