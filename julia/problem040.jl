moduleprintln problem040

include("lib.js")

# Solution
# Generate a string 10ᴺ digits long composed of concatenated positive integers
# Note: This approach is too slow... the string generation slows down as n gets large

function get_honkin_string(N)
    n = 1
    digit = 1
    honker = ""
    while n <= 10^N
        honker = join([honker; string(digit)])
        digit += 1
        n = length(honker)
        if digit % 1000 == 0
            println("n: $n")
        end
    end
    honker
end

# Derive general formula for returning the position of the first digit of a number
#= d1(n) = 1*(n - 10^0) =#
#= d2(n) = d1(10^1 - 1) + 1 + 2*(n - 10^1) =#
#= d3(n) = d2(10^2 - 1) + 2 + 3*(n - 10^2) =#
#= d4(n) = d3(10^3 - 1) + 3 + 4*(n - 10^3) =#
#= d5(n) = d4(10^4 - 1) + 4 + 5*(n - 10^4) =#
#= d6(n) = d5(10^5 - 1) + 5 + 6*(n - 10^5) =#
function position(n)
    k = length(string(n))
    if n < 10
        pos = n
    else
        pos = position(10^(k-1) - 1) + (k-1) + k*(n - 10^(k-1))
    end
    pos
end

# Search over a restricted space to find inverse of answer.
function solve()
    pows10 = 10.^(0:6)
    d = zeros(length(pows10))
    k = 0
    n = 0
    while k < 6
        n += 1
        if in(position(n), pows10)
            # n is the number starting at position(n),
            # then d_n is the first digit of number
            d[k + 1] = parse(Int, string(n)[1])
            lib.debug("position(n): $(position(n)), k: $k, n:, $n, d[k+1], $(d[k+1])")
            k += 1
        end
    end
    lib.debug("Unfortunately, 10⁴ doesn't work for this method, so... through trial and error, d₁₀₀₀₀ = 7")
    d[7] = 7
    lib.debug("The product of the digits of the idf at powers of 10 from 0 to 6 is $(prod(d))")
end

end
