
#task 

function splitintwo(x, y)

    x_len = Int32(length(x) / ndims(x))
    y_len = Int32(length(y) / ndims(y))

    if x_len % 2 == 0
        x_middle = Int32(x_len / 2)
    else
        x_middle = Int32(floor(x_len / 2) + 1)
    end

    if y_len % 2 == 0
        y_middle = Int32(y_len / 2)
    else
        y_middle = Int32(floor(y_len / 2) + 1)
    end

    x_left = x[1: x_middle, :]
    x_right = x[x_middle + 1:x_len , :]

    y_left = zeros(y_middle, 2)
    y_right = zeros(y_len - y_middle, 2)

    l_index = 1
    r_index = 1

    for i in 1:y_len
        for j in 1:x_middle
            if y[i, :] == x_left[j, :]
                y_left[l_index, :] = y[i, :]
                l_index += 1
                
            elseif length(x_right) != length(x_left) && j == x_middle
                continue

            elseif y[i, :] == x_right[j, :]
                y_right[r_index, :] = y[i, :]
                r_index += 1
            end

        end
    end

    return x_left, x_right, y_left, y_right
end

#tests

function tests()
    x = [1.0 2.0; 2.0 3.0; 3.0 2.0; 4.0 5.0; 6.0 6.0; 7.0 1.0]
    y = [7.0 1.0; 1.0 2.0; 3.0 2.0; 2.0 3.0; 4.0 5.0; 6.0 6.0]
    expected = ([1.0 2.0; 2.0 3.0; 3.0 2.0], 
                [4.0 5.0; 6.0 6.0; 7.0 1.0],
                [1.0 2.0; 3.0 2.0; 2.0 3.0],
                [7.0 1.0; 4.0 5.0; 6.0 6.0])

    result = splitintwo(x, y)
    
    if result == expected
        println("🔥 Test 1 passed!")
    else
        println("😞 Test 1 failed! Got: ", result, " Expected: ", expected)
    end
    
    x = [1.0 2.0; 2.0 3.0; 7.0 1.0]
    y = [7.0 1.0; 1.0 2.0; 2.0 3.0]
    expected = ([1.0 2.0; 2.0 3.0],
    [7.0 1.0],
    [1.0 2.0; 2.0 3.0],
    [7.0 1.0])

    result = splitintwo(x, y)
    
    if result == expected
        println("🔥 Test 2 passed!")
    else
        println("😞 Test 2 failed! Got: ", result, " Expected: ", expected)
    end
            
end

tests()

