

# Task
function countingsortlength(A)
        # Find the longest element in A
        longest = -1
        for i in 1:length(A)
            if length(A[i]) > longest
                longest = length(A[i])
            end
        end
        # Since the empty string "" also requires a place in 
        # the count_array, make the array one element longer
        count_array = zeros(Int, 1, longest + 1)
        
        # Count the occurances of each length of strings
        for i in 1:length(A)
            index = find_valid_index(A, i)
            count_array[index] += 1
        end
    
        # Make the table cumulative
        for i in 2:length(count_array)
            count_array[i] += count_array[i - 1]
        end
        
        sorted_array = Vector{Union{Nothing, String}}(nothing, length(A))
    
        # Place the elements in the right order in sorted_array
        for i in length(A):-1:1
            index = find_valid_index(A, i)
            sorted_array[count_array[index]] = A[i]
            count_array[index] -= 1
        end
        
        return sorted_array
    
end


# Help function
function find_valid_index(A, index)
    return length(A[index]) + 1 
end

### Tests

printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test countingsortlength(["ccc", "bb", "a"]) == ["a", "bb", "ccc"]
    @test countingsortlength(["aaa", "bb", "c"]) == ["c", "bb", "aaa"]
    @test countingsortlength(["bb", "a", ""]) == ["", "a", "bb"] # Testen her sjekker om du kan sortere også med emtpy string
    @test countingsortlength(["bbbb", "aa", "aaaa", "ccc"]) == ["aa", "ccc", "bbbb", "aaaa"] # Fra oppgaven
end
