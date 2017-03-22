"""
An irrational decimal fraction is created by concatenating the positive
integers:

0.123456789101112131415161718192021...
1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21

It can be seen that the 12th digit of the fractional part is 1.

If dn represents the nth digit of the fractional part, find the value of the
following expression.

d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
"""

module problem040

function sumk(k)
    k == 0 && return 1
    k == 1 && return 8
    return k*(10^(k) - 1 - 10^(k-1) + 1)
end

function solve()
    k = 6
    sum0 = 1
    sum1 = 8
    sum2 = 2*(99 - 10 + 1)
    sum3 = 3*(999 - 100 + 1)
    sum4 = 4*(999 - 100 + 1)
    pows10 = 10.^(0:k)
    result = n_digits = 1
    val = d_n = 0

    while d_n < 10^k
        val += 1
        d_n += curpow + 1
    end

    result
end
end
