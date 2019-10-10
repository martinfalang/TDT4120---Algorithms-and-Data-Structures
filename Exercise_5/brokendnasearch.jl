
mutable struct Node
    children::Dict{Char,Node}
    count::Int
end

# Task
function brokendnasearch(root, dna, i=1)

    if i > length(dna)
        # means we got to the end of the string
        return root.count
    end
    
    count = 0

    if haskey(root.children, dna[i])
        # search down one child
        count += brokendnasearch(root.children[dna[i]], dna, i + 1)
    elseif dna[i] == '?'
        # search down all children
        for child in values(root.children)
            count += brokendnasearch(child, dna, i + 1)
        end
    end

    return count
end


### Contructed test data ###
root1 = Node(Dict('A' => Node(Dict{Char,Node}(), 1)), 0)
root2 = Node(Dict('A' => Node(Dict('G' => Node(Dict('T' => Node(Dict('A' => Node(Dict{Char,Node}(), 1),'T' => Node(Dict{Char,Node}(), 1),'C' => Node(Dict{Char,Node}(), 1)), 4)), 5)), 5)), 0)
root3 = Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict('C' => Node(Dict{Char,Node}(), 1)), 2)), 3)), 4)), 5)), 6)), 0)

s1 = "A"
s2 = "T"
s3 = "?"
s4 = "??"
s5 = "C?C"
s6 = "???"
s7 = "?????"

# Tests

printstyled("\n\n\n---------------\nRunning tests!!\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
	@test brokendnasearch(root1, s1) == 1
	@test brokendnasearch(root1, s2) == 0
	@test brokendnasearch(root1, s3) == 1
	@test brokendnasearch(root1, s4) == 0
	@test brokendnasearch(root2, s1) == 5
	@test brokendnasearch(root2, s3) == 5
	@test brokendnasearch(root2, s4) == 5
	@test brokendnasearch(root2, s5) == 0
	@test brokendnasearch(root2, s6) == 4
	@test brokendnasearch(root3, s5) == 4
	@test brokendnasearch(root3, s6) == 4
	@test brokendnasearch(root3, s7) == 2
end

println("---------------------------------------------------------\n\n")