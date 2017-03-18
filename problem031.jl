"""
In England the currency is made up of pound, £, and pence, p, and there are
eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
"""

module problem031

"""
strategy:
    solutions for
    a + 2b + 5c + 10d + 20e + 50f + 100g + 200h = 200
    brutish force is 20-30 minutes
    adapted recursive solution from official overview
"""

coins = [1, 2, 5, 10, 20, 50, 100, 200]
amount = 200

function ways(target, avc)
    avc <= 1 && return 1
    result = 0

    while target >= 0
        result = result + ways(target, avc - 1)
        target = target - coins[avc]
    end

    result
end

function solve()
    ways(amount, length(coins))
end

end
