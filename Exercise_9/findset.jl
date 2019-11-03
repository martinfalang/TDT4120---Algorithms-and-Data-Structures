# Task
function findset(x)
    if x != x.p
        x.p = findset(x.p)
    end
    return x.p
end

if PROGRAM_FILE != "" && realpath(@__FILE__) == realpath(PROGRAM_FILE)

    mutable struct DisjointSetNode
        rank::Int
        p::DisjointSetNode
        DisjointSetNode() = (obj = new(0); obj.p = obj;)
    end

end

