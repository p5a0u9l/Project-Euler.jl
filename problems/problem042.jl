#!/usr/local/bin/julia

# Problem Statement
println("Tihe nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so")
println("the first ten triangle numbers are:")
println()
println("1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...")
println()
println("By converting each letter in a word to a number corresponding to its alphabetical")
println("position and adding these values we form a word value. For example, the word value")
println("for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we")
println("shall call the word a triangle word.")
println()
println("Using words.txt (right click and 'Save Link/Target As...'), a 16K text file")
println("containing nearly two-thousand common English words, how many are triangle words?")

# Notes:
# a word with 10 z's would only equal 270, so computing triangle number up to 500 should be more than sufficient. This can be done in a lookup table. What's needed is a function that returns true/false on whether the number is triangle. Second, a function is needed that can return the coded value of a word. The main loop should count up the occurences of triangle words

# Solution   
CODE_CONST = Int("A"[1]) - 1 # A - this number should give 1
n = 1:30
tn = round(Int64, 0.5*n.*(n+1))

function istriangle(num)
    return in(num, tn)
end

function get_code(word)
    code = 0
    for letter in word
        #= println("Value is: $(Int(letter[1]) - CODE_CONST)") =#
        code += Int(letter[1]) - CODE_CONST 
    end
    code
end

function main()
    wc = 0
    file = open("data/p042_words.txt")
    text = readall(file)
    text = replace(text, "\"", "")
    words = split(text, ",")
    for word in words
        if istriangle(get_code(word)) 
            wc += 1
        end
    end
    println("\nThere are $wc triangle words in words.txt\n")
end


@time main()
