"""
The fraction 49/98 is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that 49/98 = 4/8,
which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction,
less than one in value, and containing two digits in the numerator and
denominator.

If the product of these four fractions is given in its lowest common terms,
find the value of the denominator.
"""

module problem033

DEBUG = false

function solve()
    mod10(n, d) = n % 10 == 0 || d % 10 == 0
    result = [1, 1]
    for n = 11:99, d = n + 1:99
        mod10(n, d) && continue
        num = flipdim(digits(n), 1)
        den = flipdim(digits(d), 1)
        for i = 2, j = 1
            if num[2] == den[1]
                if n/d == num[1]/den[2]
                    DEBUG && println("$n    $(num[1])")
                    DEBUG && println("-- = --")
                    DEBUG && println("$d    $(den[2])")
                    result[1] *= n
                    result[2] *= d
                end
            end
        end
    end
    (result[1]//result[2]).den
end

end
