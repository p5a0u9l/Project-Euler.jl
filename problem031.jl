
function p031(N)
    coins = [1,2,5,10,20,50,100,200]
    ways = [1; zeros(N, 1)]
    
    for coin in coins
        for i in range(coin, N+1)
            ways[i] += ways[i - coin + 1]
        end
    end
    ways
end

