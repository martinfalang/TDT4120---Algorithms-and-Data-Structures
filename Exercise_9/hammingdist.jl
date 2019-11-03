
# Task
function hammingdistance(s1, s2)
    if length(s1) != length(s2) 
        return -1
    end

    hdist = 0

    for i in 1:length(s1)
        if s1[i] != s2[i]
            hdist += 1
        end
    end

    return hdist
end


# Tests
if PROGRAM_FILE != "" && realpath(@__FILE__) == realpath(PROGRAM_FILE)

    s1 = "AG"
    s2 = "AT"

    rv = hammingdistance(s1, s2)

    if rv == 1
        println("Test 1 passed")
    else
        println("Test 1 failed, got ", rv)
    end

    s1 = "ATG"
    s2 = "GTA"

    rv = hammingdistance(s1, s2)

    if rv == 2
        println("Test 2 passed")
    else
        println("Test 2 failed, got ", rv)
    end
end