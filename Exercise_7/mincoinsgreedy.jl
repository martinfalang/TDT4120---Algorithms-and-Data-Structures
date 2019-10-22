
# Task
function mincoinsgreedy(coins, value)

    # Greedy choice: pick the largest coin smaller than value

    num_coins = 0

    while value > 0
        for i in 1:length(coins)
            if coins[i] <= value
                num_coins += 1
                value -= coins[i]
                break
            end
        end
    end

    return num_coins

end

using Test


if PROGRAM_FILE != "" && realpath(@__FILE__) == realpath(PROGRAM_FILE)

    # Tests
    printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)

    @testset "Tester" begin
        @test mincoinsgreedy([1000,500,100,20,5,1],1226) == 6
    @test mincoinsgreedy([20,10,5,1],99) == 10
    @test mincoinsgreedy([5,1],133) == 29
    end

    println("---------------------------------------------------------\n\n")

end