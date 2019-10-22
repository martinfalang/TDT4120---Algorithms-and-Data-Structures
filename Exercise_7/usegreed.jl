
# Task
function usegreed(coins)

    for i in 1:(length(coins) - 1)
        if coins[i] % coins[i + 1] != 0
            return false
        end
    end

    return true

end