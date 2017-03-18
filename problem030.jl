"""
Surprisingly there are only three numbers that can be written as the sum of
fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth
powers of their digits.
"""

module problem030

"""
strategy:
    a number that can be written as the sum of fifth powers of its digits
    satisfies
    a + 32b + 243c + 1024d + 3125e + 7776f + 16897g + 32768h + 59049i
    where all of a..i are >= 0
    the largest single term will be 9^5 = 59049, and
"""

function fifths(n)
    return n == sum([i^5 for i in digits(n)])
end

function solve()
    N = 200000
    sum(filter(fifths, 2:N))
end

end
