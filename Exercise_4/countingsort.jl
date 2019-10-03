function countingsortletters(A,position)
    # Find the largest element in A
    largest_value = -1
    for i in 1:length(A)
        char_value = chartodigit(A[i][position])
        if char_value > largest_value
            largest_value = char_value
        end
    end
    
    # Make an array with largest_value number of elements
    count_array = zeros(Int, 1, largest_value + 1)
    
    # Count the occurances of each letter
    for i in 1:length(A)
        index = chartodigit(A[i][position])
        count_array[index + 1] += 1
    end

    # Make the table cumulative
    for i in 2:largest_value
        count_array[i + 1] += count_array[i]
    end
    
    sorted_array = Vector{Union{Nothing, String}}(nothing, length(A))

    # Place the elements in the right order in sorted_array
    for i in length(A):-1:1
        index = chartodigit(A[i][position])
        sorted_array[count_array[index + 1]] = A[i]
        count_array[index + 1] -= 1
    end
    
    return sorted_array

end

function chartodigit(character)
    return character - '`'
end

using Test

if PROGRAM_FILE != "" && realpath(@__FILE__) == realpath(PROGRAM_FILE)
    ### Tests ###
    printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)
    @testset "Basic tests" begin
        @test countingsortletters(["aa", "bb", "cc"], 1) == ["aa", "bb", "cc"]
        @test countingsortletters(["cc", "bb", "aa"], 2) == ["aa", "bb", "cc"]
        @test countingsortletters(["ac", "bb", "ca"], 2) == ["ca", "bb", "ac"]
        @test countingsortletters(["ccc", "cba", "ca", "ab", "abc"], 2) == ["ca", "cba", "ab", "abc", "ccc"]
    end
end
