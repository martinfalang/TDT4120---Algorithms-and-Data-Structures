
mutable struct Node
    children::Dict{Char, Node}
    count::Int
end

# Task

function searchtree(root, dna) 

    current_node = root
    
    for letter in dna
        if haskey(current_node.children, letter)
            current_node = current_node.children[letter]
        else
            return 0
        end
    end
    
    return current_node.count

end


# Tests

using Test

if PROGRAM_FILE != "" && realpath(@__FILE__) == realpath(PROGRAM_FILE)
    
    ### Test data ###
    
    root1 = Node(Dict('A' => Node(Dict{Char,Node}(), 1),'G' => Node(Dict('A' => Node(Dict{Char,Node}(), 2)), 1)), 0)
    root2 = Node(Dict('A' => Node(Dict{Char,Node}(), 1),'G' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'G' => Node(Dict{Char,Node}(), 1)), 1),'T' => Node(Dict('G' => Node(Dict('T' => Node(Dict{Char,Node}(), 1)), 0),'T' => Node(Dict('G' => Node(Dict{Char,Node}(), 1)), 0)), 0),'C' => Node(Dict('C' => Node(Dict('A' => Node(Dict{Char,Node}(), 1)), 1)), 1)), 0)
    
    s1 = "AG"
    s2 = "GA"
    s3 = "TGT"
    
    printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)

    @testset "Tester" begin
    	@test searchtree(root1, s1) == 0
    	@test searchtree(root1, s2) == 2
    	@test searchtree(root1, s3) == 0
    	@test searchtree(root2, s1) == 0
    	@test searchtree(root2, s2) == 1
    	@test searchtree(root2, s3) == 1
    end
    
    println("---------------------------------------------------------\n\n")
end