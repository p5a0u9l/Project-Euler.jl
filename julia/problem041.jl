#!/usr/local/bin/julia

# Problem Statement
println("We shall say that an n-digit number is pandigital if it makes use of all the") 
println("digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also") 
println("prime. What is the largest n-digit pandigital prime that exists?")

# Solution   
# Assume that the largest n-digit pandigital contains each of the 10 digits, 0, 1, 2, ..., 9.
# Then the largest pandigital is 9876543210, however this number is even and not prime. 
# By decrementing from the above number, the first prime pandigital that is encountered is 
# the largest. One way to efficiently decrement would be to shift the digits. Each decrement 
# would contain one shift. This ensures each iteration is a pandigital number. A formula or 
# pattern is needed which shifts the numbers in the 10 digit pandigital such that each iteration
# is the next smallest pandigital. Start with the 9th and 10th digits sort the two permutations
# Then the 8th, 9th, and 10th digits, (0, 1, 2), sort (descending) the six permutations
# 210, 201, 120, 102, 021, 012. Then the 7th, 8th, 9th, and 10th digits, (0, 1, 2, 3) sort 
# (desending) the 16 permutations. 3210, 3201, 3120, 3102, 3021, 3012, 2310, 2301, 2130, 2103,
# ..., 0123. Zeros in the first position will have to be accounted for the joining back to the main number. A permutation generator will be needed. 

function main()
    number_found = false
    k = 9
    big_num = 9876543210
    while !number_found
       #= base = string(big_num)[1:9 - k] =#
       perms = collect(permutations(1:k))
       for ip = length(perms):-1:1 
          tail = join(perms[ip])
          #= big_num = parse(Int, join([base, tail])) =#
          big_num = parse(Int, tail)
          if ip % 10000 == 0
              println("big num: $big_num")
          elseif isprime(big_num)
              println("Found prime: $big_num")
              number_found = true
              break
          end
       end
       println("\n\nNo Primes found for n = 1:$k, search n = 1:$(k-1)\n\n")
       k -= 1
    end
    println("The largest n-digit pandigital prime that exists is $big_num")
end

@time main()
