def gluggish_octopus(arr)
    arr.each do |el| 
        if arr.all?{|el2| el2 <=el}
        return el
        end 
    end 
    return false 
end

def dominant_octopus(arr)
    arr.sort_by(:&length)[-1]
end

def clever_octopus(arr)
    max=""
    arr.each do |el|
        if el.length > max.length
            max = el
        end 
    end 
    return max
end

def slow_dance(str,arr)
    arr.each_with_index do |el,i|
        if el == str 
            return i
        end 
    end 
    return -1
end

def constant_dance(str, hash)
    if hash.has_key?(str)
        return hash[str]
    else  
        return nil
    end 
end
