
# Task
function dnasimilarity(s1, s2)
    
    count = 0

    for i in 1:length(s1)
        if s1[i] == s2[i]
            count += 1
        end
    end
    
    return count
end


# Tests
using Test

if PROGRAM_FILE != "" && realpath(@__FILE__) == realpath(PROGRAM_FILE) 

    printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)

    @testset "Tester" begin
	    @test dnasimilarity("A", "A") == 1
	    @test dnasimilarity("A", "T") == 0
	    @test dnasimilarity("ATCG", "ATGC") == 2
	    @test dnasimilarity("ATATATA", "TATATAT") == 0
	    @test dnasimilarity("ATGCATGC", "ATGCATGC") == 8
	    @test dnasimilarity("CAATAAGGATCTGGTAGCTT", "CCTTACTGAAGCCGCTATGC") == 6
    end

    println("---------------------------------------------------------\n\n")


end
