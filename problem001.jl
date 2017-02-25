"""
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
"""

module problem001

function solve()
    N = 5000
    s = 0
    for i = 1:N - 1
        if (i % 3 == 0) | (i % 5 == 0); s += i; end
    end
    println("The sum of all the multiples of 3 or 5 below $N is $s")
end

end
