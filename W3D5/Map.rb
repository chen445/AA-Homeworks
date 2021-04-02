class Map
    def initialize
      @my_map=[]
    end

    def set(key,value)
      @my_map.each do |pair|
        if pair[0]==key
            index=@my_map.index(pair)
            return @my_map[index]=[key,value]
        end 
      end
      @my_map << [key,value]
    end

    def get(key)
        @my_map.each do |pair|
            if pair[0]==key
                index=@my_map.index(pair)
                return @my_map[index][1]
            end 
       end 
       return nil 
    end


    def delete(key)
        @my_map.each do |pair|
            if pair[0]==key
                index=@my_map.index(pair)
                @my_map.delete(@my_map[index])
            end 
        end 
    end

    def show
        p @my_map
    end
end

