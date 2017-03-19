"""
The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in
base 10 and base 2.

(Please note that the palindromic number, in either base, may not include
leading zeros.)
"""

module problem036

function solve()
    N = 1000000
    s = 0
    for n = 1:N
        d = string(n)
        b = bin(n)
        if reverse(d) == d && reverse(b) == b
            s += n
            println("Palindromic: $d, $b")
        end
    end
    s
end

end
