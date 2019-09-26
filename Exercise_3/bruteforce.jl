
# task

function bruteforce(x)

    x_len = Int32(length(x) / ndims(x))

    shortest_dist = Inf

    checked_index = zeros(x_len, x_len)
    #num_of_comp = 0
    for i in 1:x_len
        for j in 1:(x_len - 1)
            if j == i
                continue
            end
            
            if checked_index[i, j] != 0 || checked_index[j, i] != 0
                continue
            else
                dist_x = x[i, 1] - x[j, 1]
                dist_y = x[i, 2] - x[j, 2]
        
                dist = sqrt(dist_x^2 + dist_y^2)
                
                if dist < shortest_dist
                    shortest_dist = dist
                end

                checked_index[i,j] = 1
                #num += 1
            end
        end
    end
    # print("Num of comp: ", num_of_comp)
    return shortest_dist
end

# tests
function tests()
    x = [1 1; 10 0; 2 2; 5 5]
    result = bruteforce(x)
    if result == sqrt(2)
        println("🔥 Test 1 passed!")
    else
        println("😞 Test 1 failed! Got: ", result, " Expected: ", sqrt(2))
    end

    x = [10.0 10.0; 10.0 12.0; 100.0 0.0; 110.0 0.0; 140.0 0.0; 10.0 11.0]
    result = bruteforce(x)
    if result == 1.0
        println("🔥 Test 2 passed!")
    else
        println("😞 Test 2 failed! Got: ", result, " Expected: ", 1.0)
    end
end

tests()