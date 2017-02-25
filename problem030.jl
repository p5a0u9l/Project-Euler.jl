"""
Surprisingly there are only three numbers that can be written as the sum of
fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth
powers of their digits.
"""

module problem030

function solve()
    N = 200000
    b = []
    for i = 2:N
        a = sum([parse(Int, j)^5 for j in string(i)])
        if a == i
            push!(b, i)
        end
    end
    sum(b)
end

end
