def perms (array, n = array.size-1)
    #case to jump off from recursion and return a permutation
    if  n == 0
        p array
        return array
    #else dig dipper
    else
        for i in 0..n do
            perms(array, n-1)
            if (n-1) % 2 == 1
                array[1], array[n] = array[n], array[1]
            else
                array[i], array[n] = array[n], array[i]
            end
        end
    end
end

perms [1, 2, 3]
