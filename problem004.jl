"""
A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
"""

module problem004

function is_palindrome(number)
    num_as_str = string(number)
    return num_as_str == reverse(num_as_str)
end

function generate_candidates()
    base_iter = 101:999
    idx = 0
    # max size of candidate pool
    numbers = zeros(Int, sum(collect(base_iter)))
    for i = base_iter
        j0 = max(i, div(100000, i))
        for j = j0:999
            idx += 1
            numbers[idx] = i*j
        end
    end
    return filter!(x -> x > 0, numbers)
end

"""
strategy:
    1. create unique array of 3-digit products
        a 6-digit number, A, satisfies te equation
        A = 100000a + 10000b + 1000c + 100d + 10e + 1f, for coefficients
        a, b, c, d, e, f
    2. filter by those that are palindromes
    3. select the largest
"""

function solve()
    maximum(filter!(is_palindrome, generate_candidates()))
end

end
