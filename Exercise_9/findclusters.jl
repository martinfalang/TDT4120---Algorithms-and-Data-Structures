include("findset.jl")
include("union.jl")


# Task
function findclusters(E, n, k)

    A = []

    nodes = []
    println("E: ", E)

    for i in 1:n
        push!(nodes, DisjointSetNode())
    end


    println("nodes: ", nodes)
    sort!(E)
    for i in 1:(n - k)
        u = nodes[E[i][2]]
        v = nodes[E[i][3]]
        println("u: ", u, " v: ", v)
        if findset(u) != findset(v)
            
            push!(A, (u, v))
            union!(u, v)
        end
    end

    for node in nodes
        findset(node)
    end

    println("A: ", A)
    return A
end
   
# Tests
mutable struct DisjointSetNode
    rank::Int
    p::DisjointSetNode
    DisjointSetNode() = (obj = new(0); obj.p = obj;)
end

printstyled("\n\n\n---------------\nRunning tests!\n---------------\n"; color = :magenta)


using Test
@testset "Tester" begin
    @test sort([sort(x) for x in findclusters([(1, 3, 4), (3, 1, 3), (5, 1, 4), (6, 2, 1), (7, 2, 3), (8, 3, 1), (9, 3, 2), 
    (10, 4, 1), (11, 4, 2), (12, 4, 3), (4, 2, 4), (2, 1, 2)], 4, 2)]) == sort([[1, 2], [3, 4]])
    @test sort([sort(x) for x in findclusters([(1, 3, 4), (3, 1, 3), (5, 1, 4), (6, 2, 1), (7, 2, 3), (8, 3, 1), (9, 3, 2), 
    (10, 4, 1), (11, 4, 2), (12, 4, 3), (4, 2, 4), (2, 1, 2)], 4, 3)]) == sort([[1], [2], [3, 4]])
end

println("---------------------------------------------------------\n\n")