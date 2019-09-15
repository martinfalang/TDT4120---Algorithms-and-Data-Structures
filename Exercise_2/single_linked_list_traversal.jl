
# Elements of the linked list
mutable struct Node
    next::Union{Node, Nothing} # means next can point to a Node object or nothing
    value::Int
end

# Creates the list starting from the last element
# This is done so the last element we generate is the head

function createlinkedlist(length)
    child = nothing
    node = nothing

    for i in 1:length
        node = Node(child, rand(1:800))
        child = node
    end
    return node
end

# Task
function findindexinlist(linkedlist, index)
    node = linkedlist
    current_index = 1

    if (index < 1)
        return -1
    end
    
    while current_index < index
        if node.next == nothing
            return -1
        end
        current_index += 1
        node = node.next
    end

    return node.value
end

# For testing
function print_linked_list(linked_list)
    node = linked_list
    index = 1

    print("[ ")
    while node != nothing 
        print(index, ":", node.value, ", ")
        node = node.next
        index += 1
    end
    println("]")
end

