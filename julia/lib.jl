module lib
function divisorsum(n)
    """
    adapted from https://rosettacode.org/wiki/Factors_of_an_integer#Julia
    computes the (proper) divisors of a number, ``n``, and return the sum
    """
    f = [one(n)]
    for (p, k) in factor(n)
        f = reduce(vcat, f, [f*p^j for j in 1:k])
    end
    return sum(f[1:end - 1])
end
end
