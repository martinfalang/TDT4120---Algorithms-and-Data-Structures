
# Task
function cumulative(weights)
    
    rows, cols = size(weights)

    cumulative_list = zeros(Int, rows, cols)

    # Copy the first row as it will be the same anyway
    cumulative_list[1, 1:cols] = [weights[1, y] for y = 1:cols]

    for x = 2:rows
        for y = 1:cols
            if y == 1
                shortest_prev_path = min(cumulative_list[x - 1, y], cumulative_list[x - 1, y + 1])
            elseif y == cols
                shortest_prev_path = min(cumulative_list[x - 1, y - 1], cumulative_list[x - 1, y])
            else
                shortest_prev_path =  min(cumulative_list[x - 1, y - 1], cumulative_list[x - 1, y], cumulative_list[x - 1, y + 1])                
            end               
            cumulative_list[x, y] = weights[x, y] + shortest_prev_path
        end
    end

    return cumulative_list
end


# Tests

printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test cumulative([1 1 ; 1 1]) == [1 1 ;2 2]
	@test cumulative([3  6  8 6 3; 7  6  5 7 3; 4  10 4 1 6; 10 4  3 1 2;6  1  7 3 9])== [3  6  8  6  3;10 9  11 10 6;13 19 13 7  12;23 17 10 8  9;23 11 15 11 17]
end

println("---------------------------------------------------------\n\n")