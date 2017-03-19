"""
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
"""

module problem033


function solve()
    for n = 10:98, d = n + 1:99
        numer = string(n)
        denom = string(d);
        for i = 1:2, j = 1:2
            if in('0', numer) || in('0', denom); continue; end
            if numer[i] == denom[j]
                f = n/d
                num_ = numer[(i % 2) + 1]; den_ = denom[(j % 2) + 1];
                if f == parse(Int, num_)/parse(Int, den_)
                    println("$numer/$denom = $num_/$den_ = $f")
                end
            end
        end
    end
    f
end

end
