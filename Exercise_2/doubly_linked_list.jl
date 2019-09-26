
mutable struct NodeDoublyLinked
    prev::Union{NodeDoublyLinked, Nothing}
    next::Union{NodeDoublyLinked, Nothing}
    value::Int
end

function createLinkedListDoublyLinked(length)
    # Create the list from the last element in the chain
    # This is so the returned element will be the first in the chain
    current = nothing
    beforeCurrent = nothing
    i = 1
    for i in 1:length
        # only fill out the next field because prev will be filled out later
        current = NodeDoublyLinked(nothing, beforeCurrent, i)
        # link up the node before this node to this node
        if beforeCurrent != nothing
            beforeCurrent.prev = current
        end
        beforeCurrent = current
        i += 1
    end
    return current
end

# Task
function maxofdoublelinkedlist(linkedlist) 

    max_value = linkedlist.value

    # Search forwards
    node = linkedlist
    while node != nothing
        # println("Going forwards. Found: ", node.value)
        if node.value > max_value
            max_value = node.value
        end
        node = node.next
    end

    # Search backwards
    node = linkedlist.prev
    while node != nothing
        # println("Going backwards Found: ", node.value)
        if node.value > max_value
            max_value = node.value
        end
        node = node.prev
    end

    return max_value
end

# For testing

function print_doubly_linked_list(linkedlist)
    node = linkedlist

    # Find head
    while node.prev != nothing
        node = node.prev
    end

    # Iterate through and print
    print("[ ")
    while node != nothing
        print(node.value, ", ")
        node = node.next
    end
    println("]")
end