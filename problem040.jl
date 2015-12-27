#!/usr/local/bin/julia

# Problem Statement
println("An irrational decimal fraction is created by concatenating the positive integers:")
println("0.123456789101112131415161718192021...")
println("It can be seen that the 12th digit of the fractional part is 1.")
println("If d_n represents the nth digit of the fractional part, ")
println("find the value of the following expression.")
println("d₁ × d₁₀  × d₁₀₀ × d₁₀₀₀ × d₁₀₀₀₀ × d₁₀₀₀₀₀ × d₁₀₀₀₀₀₀\n")

# Solution
# Generate a string 10ᴺ digits long composed of concatenated positive integers
function get_honkin_string(N)
    n = 1
    digit = 1
    honker = ""
    while n <= 10^N
        honker = join([honker; string(digit)]) 
        digit += 1
        n = length(honker)
    end
    honker
end


function main()
    value = 1
    pow10 = 6
    honker = get_honkin_string(pow10)
    for n = 1:pow10
        value *= 
    end
end

@time main()
