
# Question 1
function insertionsort(A)
    for j = 2:length(A)
        key = A[j]
        i = j - 1
        while i > 0 && A[i] > key
            A[i + 1] = A[i]
            i -= 1
        end
        A[i + 1] = key
    end
end

function print_list(list)
    for item in list
        print(item, " ")
    end
    println()
end

list = [4,2,5,7,6,8,9,6,4,2,1]

println("Unsorted list:")
print_list(list)

insertionsort(list)

println("Sorted list:")
print_list(list)

