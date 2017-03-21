"""
If p is the perimeter of a right angle triangle with integral length sides,
{a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
"""

module problem039
include("lib.jl")
using StatsBase

function find_pythag_triplets(N)
    """
    Solution
    By Pythagorean's Theorem, the hypotenuse of a right triangle if given by
    c² = a² + b²
    If a, b, and c are integer they form a Pythagorean triplet.
    Find all such triplets < N
    """
    count = 0
    K = round(Int, sqrt(N))
    all_pythag_triplets = zeros(Int, 400, 4)
    for n = 1:K, m = n + 1:K
        are_coprime = gcd(m, n) == 1
        are_odd = (m - n) % 2 == 1
        if are_coprime && are_odd
            k = 1
            (a, b, c, p) = euclid(m, n, k)
            while p <= N
                euclid_entry = sort([a, b, c, p])
                if ~in(euclid_entry, all_pythag_triplets)
                    count += 1
                    all_pythag_triplets[count, :] = euclid_entry
                end
                k += 1
                (a, b, c, p) = euclid(m, n, k)
            end
        end
    end
    return all_pythag_triplets[all_pythag_triplets[:, 1] .!= 0, :]
end

function euclid(m, n, k)
    """
    Euclid's formula states that for an arbitrary pair of positive integers,
    m and n, with m > n, m - n odd and m, n coprime, then the integers
    a = k ⋅(m² - n²), b = k ⋅(2mn), c = k ⋅(m² + n²) form all primitive
    Pythagorean triples and their multiples are generated with multiples of k
    https://en.wikipedia.org/wiki/Pythagorean_triple
    """
    b = k*(2*m*n)
    a = k*(m^2 - n^2)
    c = k*(m^2 + n^2)
    p = a+b+c
    a, b, c, p
end

function solve()
    N = 1000
    P = find_pythag_triplets(N)
    P = sortrows(P, by = x -> x[4])
    perimeters = P[:, 4]
    h = fit(Histogram, perimeters)
    i_max_p = indmax(h.weights)
    edges = collect(h.edges)
    edges[1][i_max_p]
end
end
