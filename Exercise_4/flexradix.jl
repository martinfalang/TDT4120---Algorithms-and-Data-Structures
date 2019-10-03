
include("countingsort.jl")
include("countingsort_length.jl")

function flexradix(A, maxlength)

    # Sort A after length. This must be done as the 
    # following algorithm can't sort for example 
    # ['ab', 'a'] in the right order so it must be
    # done by length  
    A = countingsortlength(A)
    

    for digit in maxlength:-1:1
        
        # This array will include the words in A that 
        # have length of digit or more
        words = []
        # This array will include the indexes from A that
        # have a number that has a length of digit or more
        indexes = []

        # Find the elements with length longer than digit
        for i in 1:length(A)
            if length(A[i]) >= digit
                push!(words, A[i])
                push!(indexes, i)
            end
        end
        
        # Sort these words at position digit
        words = countingsortletters(words, digit)

        # Replace the indexes we took elements from in A 
        # with the now sorted values 
        for i in 1:length(words)
            A[indexes[i]] = words[i]
        end
        
    end

    return A

end

using Test

if PROGRAM_FILE != "" && realpath(@__FILE__) == realpath(PROGRAM_FILE) 
    ### Tests
    printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)
    @testset "Basic tests" begin
        @test flexradix(["d", "c", "b", "a"], 1) == ["a", "b", "c", "d"]
        @test flexradix(["d", "c", "b", ""], 1) == ["", "b", "c", "d"]
        @test flexradix(["jeg", "elsker", "deg"], 6) == ["deg", "elsker", "jeg"]
        @test flexradix(["denne", "oppgaven", "mangler", "emojies"], 8) == ["denne", "emojies", "mangler", "oppgaven"]
        @test flexradix(["kobra", "aggie", "agg", "kort", "hyblen"], 6) == ["agg", "aggie", "hyblen", "kobra", "kort"] # Fra oppgaven
    end
end