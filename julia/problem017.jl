"""
If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out
in words, how many letters would be used?
"""

module problem017

DEBUG = true

"""
one, two, three, four, five, six, seven, eight, nine,
ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty,
thirty, forty, fifty, sixty, seventy, eighty, ninety
hundredand, thousand
Σ 1, 2, ..., 9 * tens - (10..20) * hundreds
Σ 10, 11, ..., 20 * hundreds
Σ 30, 40, ..., 90 * hundreds
100, 101, 102, ..., 199, 200, 201, ..., 299, ..., 900, ..., 999
"""

function solve()
    library = [3, 3, 5, 4, 4, 3, 5, 5, 4, 3, 6, 6, 8, 8, 7, 7, 9, 8, 8,
              6, 6, 5, 5, 5, 7, 6, 6, 7, 8, 3]
    result = sum(library[1:9])*9*10
    result += sum(library[10:19])*10
    result += sum(library[20:27])*10*10
    result += sum(library[1:9])*100
    result += library[28]*100*9
    result += library[29] + 3
    result += library[30]*99*9
    DEBUG && println("result: $result")
end

end
