include("usegreed.jl")
include("mincoinsgreedy.jl")

# Task
function mincoins(coins, value)
    if usegreed(coins) == true
        return mincoinsgreedy(coins, value)
    end
    inf = typemax(Int)
    # Have to find the first coin value smaller than value
    largest_value_index = inf
    for i in 1:length(coins)

        if coins[i] <= value
            largest_value_index = coins[i]
    end

    if largest_value_index == inf 
        return 0
    end

    
end



# Tests
printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)

using Test
    @testset "Tester" begin
    @test mincoins([4,3,1],18) == 5
    @test mincoins([1000,500,100,30,7,1],14) == 2
    @test mincoins([40, 30, 20, 10, 1], 90) == 3
end

println("---------------------------------------------------------\n\n")