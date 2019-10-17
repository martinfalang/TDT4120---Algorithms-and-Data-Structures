
# Task
function backtrack(pathweights)

    path = []

    rows, cols = size(pathweights)

    # Search the whole first row for a place to start
    y_index = argmin(pathweights[rows, :])
    push!(path, (rows, y_index))

    # Now only search the points around the current point
    for x = rows - 1:-1:1

        if y_index == 1
            y_index = argmin(pathweights[x, y_index : y_index + 1])
        
        # The -2 is to make the new y_index relative to the previous
        elseif y_index == cols
            y_index += argmin(pathweights[x, y_index - 1 : y_index]) - 2
        else
            y_index += argmin(pathweights[x, y_index - 1 : y_index + 1]) - 2
        end
    
        push!(path, (x, y_index))
    end

    return path

end

# Tests
printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test backtrack([1 1 ; 2 2]) == [(2,1),(1,1)]
	@test backtrack([3  6  8  6  3; 10 9  11 10 6; 13 19 13 7  12; 23 17 10 8  9; 23 11 15 11 17]) == [(5,2), (4,3), (3,4), (2,5), (1,5)]
end

println("---------------------------------------------------------\n\n")