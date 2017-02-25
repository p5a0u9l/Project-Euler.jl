"""
A palindromic number reads the same both ways. The largest palindrome made from the product of
two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
"""

module problem004

Base.MPFR.set_bigfloat_precision(2^13)

function solve()
    N = 1000
    maxCircular = 0
    maxDiv = 1
    for d = 2:N-1
        c = 0;
        m = 0
        bigstr = replace(string(BigInt(1)/d), ".", "")
        bigstr = replace(bigstr, "e-01", "")[2:end-2]
        K = length(bigstr) # 77
        for i = 1:div(K, 2)
            a = bigstr[1:i]
            r = bigstr[1+i:1+i+length(a)-1]
            if a == r
                if m == 1
                    j = round(Int, i/2)
                    if a[1:j] == a[j+1:end]; break; end
                end
                c = i
                if c > maxCircular;
                    maxCircular = c;
                    maxDiv = d
                end
                m = 1
            end
        end
    end
    println("The denominator which generates the longest recurring ")
    println("cycle is $maxDiv, with length $maxCircular")
end

end
