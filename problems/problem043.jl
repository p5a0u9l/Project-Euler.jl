#!/usr/local/bin/julia

# Problem Statement
println("The number, 1406357289, is a 0 to 9 pandigital number because it is made up of")
println("each of the digits 0 to 9 in some order, but it also has a rather interesting")
println("sub-string divisibility property.")
println()
println("Let d₁ be the 1st digit, d₂ be the 2nd digit, and so on. In this way, we note")
println("the following:")
println("d₂d₃d₄ = 406 is divisible by 2")
println("d₃d₄d₅ = 063 is divisible by 3")
println("d₄d₅d₆ = 635 is divisible by 5")
println("d₅d₆d₇ = 357 is divisible by 7")
println("d₆d₇d₈ = 572 is divisible by 11")
println("d₇d₈d₉ = 728 is divisible by 13")
println("d₈d₉d₁₀ = 289 is divisible by 17")
println()
println("Find the sum of all 0 to 9 pandigital numbers with this property.\n\n")

# Notes
# All 10-digit permutations can be generated with permutations function. The search space
# would be ~3.5 million... The question is a little confusing. It's not clear to me whether
# the pattern should be repeated exactly or whether any set divisible by prime factors would 
# count... Need a function the slides over the triples in the number and checks for divibility

# Solution   
prime_facts = [2, 3, 5, 7, 11, 13, 17]
function check(number)
    digi = join(number)
    for i = 1:length(prime_facts)
        num = parse(Int, digi[(1:3) + i])
        #= println("num: $num, condition: $(num % prime_facts[i])") =#
        if num % prime_facts[i] != 0 
            return false
        end
    end
    return true
end

function main()
    pandigis = collect(permutations(0:9))[362881:end]
    result = 0
    for pan in pandigis
        if check(pan)
            pan = parse(Int, join(pan))
            result += pan
            println("Found hit: $pan")
        end
    end
    println("The sum of all 0 to 9 pandigitals with the above property is $result")
end

@time main()
