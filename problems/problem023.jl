"""
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
"""

module problem023
using Primes
include("lib.jl")

function solve()
    N = 28123
    result = sum(1:23)

    # generate list, A, containing all the abundants 12 < n < 28123
    A = [UInt16(n) for n in 12:N if lib.divisorsum(n) > n]

    # generate list, P, containing all (unique) abundant sum pairs 24 < m < 28123
    P = zeros(UInt16, sum(1:length(A)))
    k = 0
    for i in 1:length(A)
        for j = i:length(A)
            k += 1
            P[k] = A[i] + A[j]
        end
    end
    P = unique(P)

    # generate list, R, containing all integers not in P
    R = [UInt16(r) for r in 25:N if !in(r, P)]
    result += sum(R)
end
end
