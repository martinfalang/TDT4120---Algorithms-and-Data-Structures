
include("countingsort.jl")
include("countingsort_length.jl")

function flexradix(A, maxlength)

    # Add padding
    for i in 1:length(A) 
        
        for j in (length(A[i]) + 1):maxlength
            A[i] *= '`'
        end

    end

    for digit in maxlength:-1:1
        A = countingsortletters(A, digit)
    end

    # Remove padding
    for i in 1:length(A)

        index = 0

        for j in 1:length(A[i])
            if A[i][j] == '`'
                index = j
                break
            end
        end

        if index > 0
            A[i] = A[i][1:index - 1]
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