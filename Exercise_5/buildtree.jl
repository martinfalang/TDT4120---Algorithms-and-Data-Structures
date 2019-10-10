
mutable struct Node
    children::Dict{Char,Node}
    count::Int
end

Node() = Node(Dict(), 0)

### Overloads the == operator for Node object
import Base: ==
(==)(a::Node, b::Node) = a.count == b.count && a.children == b.children

# Task
function buildtree(dnasequences)
    root = Node()
    # All sequences have the empty string as prefix:
    root.count = length(dnasequences)
    
    for dna in dnasequences
        current_node = root

        for letter in dna
            
            if !haskey(current_node.children, letter)
                current_node.children[letter] = Node()
            end
            current_node = current_node.children[letter]
            current_node.count += 1
        end

    end

    return root
end

### Constructed test data ###
dnasequences1 = ["A"]
dnasequences2 = ["A", "T", "C", "G"]
dnasequences3 = ["AG", "AGT", "AGTA", "AGTT", "AGTC"]
dnasequences4 = vcat(dnasequences1, dnasequences2, dnasequences3)

tree1 = Node(Dict('A' => Node(Dict{Char,Node}(), 1)), 1)
tree2 = Node(Dict('A' => Node(Dict{Char,Node}(), 1),'G' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)
tree3 = Node(Dict('A' => Node(Dict('G' => Node(Dict('T' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)), 5)), 5)), 5)
tree4 = Node(Dict('A' => Node(Dict('G' => Node(Dict('T' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)), 5)), 7),'G' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 10)

# Tests

printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test buildtree(dnasequences1) == tree1
	@test buildtree(dnasequences2) == tree2
    	@test buildtree(dnasequences3) == tree3
	@test buildtree(dnasequences4) == tree4
end

println("---------------------------------------------------------\n\n")