
# Task

# Solution using built-in functions
function reverseandlimit(array, maxnumber)
    array = reverse(array)

    for elem in array
        if elem > maxnumber
            elem = maxnumber
        end
    end

    return array;
end


# "Manual" solution
function reverseandlimit(array, maxnumber)
    reversed_array = []

    for elem in array
        if elem <= maxnumber
            prepend!(reversed_array, elem)
        else
            prepend!(reversed_array, maxnumber)
        end
    end
    
    return reversed_array
end