"""
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""

module problem001

function solve()
    N = 1000
    iter = collect(1:N - 1)
    condition(x) = x % 3 == 0 || x % 5 == 0
    multiples = filter!(condition, iter)
    s = sum(multiples)
    s
end

end
