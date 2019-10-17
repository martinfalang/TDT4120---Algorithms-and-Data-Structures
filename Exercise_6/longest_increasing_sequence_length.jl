
# Task
function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1

    for i = 2:length(s)
        
        # Each length is initiated to 1
        mls[i] = 1
        
        # Go through the preceding part of the list and 
        # if the current element is larger than the preceding
        # element, then update the current elements longest increasing
        # sequence if the new sequence is longer than the current
        for j = 1:i-1
            if s[i] > s[j]
                mls[i] = max(mls[j] + 1, mls[i])
            end
            
        end
    end
    println(mls)
    return maximum(mls)
end


# Tests

using Test

if PROGRAM_FILE != "" && realpath(@__FILE__) == realpath(PROGRAM_FILE) 

    printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)
    @testset "Tester" begin
        @test lislength([5,3,3,6,7]) == 3
        @test lislength([2,2,2,2]) == 1
        @test lislength([100,50,25,10]) == 1
        @test lislength([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) == 6
        @test lislength([682, 52, 230, 441, 1000, 22, 678, 695, 0, 681]) == 5
        @test lislength([441, 1000, 22, 678, 695, 0, 681, 956, 48, 587, 604, 857, 689, 346, 425, 513, 476, 917, 114, 43, 327, 172, 162, 76, 91, 869, 549, 883, 679, 812, 747, 862, 228, 368, 774, 838, 107, 738, 717, 25, 937, 927, 145, 44, 634, 557, 850, 965]) == 12
    end

    println("---------------------------------------------------------\n\n")
end