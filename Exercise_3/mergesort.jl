
#task

function mergearrays(x, y, coordinate)
    
    x_len = Int32(length(x) / ndims(x))
    y_len = Int32(length(y) / ndims(y))
    
    # println("x_len: ", x_len, " y_len: ", y_len)

    result_len = x_len + y_len
    result = zeros(Int32, result_len, 2)

    i = 1
    j = 1

    for index in 1:result_len
        if i > x_len
            result[index, coordinate] = y[j, coordinate]
            
            if coordinate == 2
                result[index, 1] = y[j, 1]
            else
                result[index, 2] = y[j, 2]
            end
            j += 1

        elseif j > y_len
            result[index, coordinate] = x[i, coordinate]
            
            if coordinate == 2
                result[index, 1] = x[i, 1]
            else
                result[index, 2] = x[i, 2]
            end
            i += 1
        else
            if i <= x_len && x[i, coordinate] <= y[j, coordinate]
                
                result[index, coordinate] = x[i, coordinate]
                
                if coordinate == 2
                    result[index, 1] = x[i, 1]
                else
                    result[index, 2] = x[i, 2]
                end
                i += 1
            else
                result[index, coordinate] = y[j, coordinate]
                
                if coordinate == 2
                    result[index, 1] = y[j, 1]
                else
                    result[index, 2] = y[j, 2]
                end
                j += 1
            end
        end
    end
    # println("Merged arrays: ", result)
    return result
end

function mergesort(x, coordinate)
    x_len = Int32(length(x) / ndims(x))

    # println("x_len: ", x_len)

    if x_len > 1
        middle = Int32(floor(x_len / 2))
        
        x_arr = x[1 : middle, :]
        y_arr = x[middle + 1: x_len, :]
        # println("x: ", x_arr)
        # println("y: ", y_arr)

        x_arr = mergesort(x_arr, coordinate)
        y_arr = mergesort(y_arr, coordinate)

        result = mergearrays(x_arr, y_arr, coordinate)

        return result
    else
        return x
    end
end

# help functions

# Creates a 2D array and fills it with random values
function create_2D_array(len) 
    array = zeros(Int32, len, 2)

    for i in 1:len
        for j in 1:2
            array[i,j] = rand(1:10)
        end
    end

    return array
end

# Test function for verification
function tests() 
    # One dimensional test
    # result = mergearrays([1, 2, 3, 4], [2, 5, 7, 9], 1)
    # println("Merge test, result: ", result, " expected: ", [1; 2; 2; 3; 4; 5; 7; 9])

    # 2D merge test 
    result = mergearrays([1 2; 2 2], [2 1; 3 3], 1)
    if result == [1 2; 2 2; 2 1; 3 3]
        println("🔥 2D merge test with coordinate 1 passed")
    else
        println("😞 2D merge test with coordinate 1 failed. Got ", result, " Expected: ", [1 2; 2 2; 2 1; 3 3])
    end

    result = mergearrays([1 2; 2 3], [2 2; 3 3], 2)
    if result == [1 2; 2 2; 2 3; 3 3]
        println("🔥 2D merge test with coordinate 2 passed")
    else
        println("😞 2D merge test with coordinate 2 failed. Got ", result, " Expected: ", [1 2; 2 2; 2 3; 3 3])
    end

    # Mergesort tests
    result = mergesort([1 2; 4 6; 2 1], 1)
    if  result == [1 2; 2 1; 4 6]
        println("🔥 Mergesort test 1 passed")
    else
        println("😞 Mergesort test 1 failed. Got: ", result, " Expected: ", [1 2; 4 6; 2 1])
    end

    if mergesort([1 2; 4 5; 2 1], 2) == [2 1; 1 2; 4 5]
        println("🔥 Mergesort test 2 passed")
    else
        println("😞 Mergesort test 2 failed")
    end

end

tests()