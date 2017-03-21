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

DEBUG = true
debug(string) = DEBUG && println(string)

function pandigital(n)
    digi = digits(n)
    return length(unique(digi)) == 9 && all(x -> x != 0, digi)
end

undigits(a) = sum([a[k]*10^(k - 1) for k = 1:length(a)])

function digits(d)
    result = []
    (d, r) = divrem(d, 10)
    push!(result, r)
    while d > 0
        (d, r) = divrem(d, 10)
        push!(result, r)
    end
    return flipdim(result, 1)
end

end
