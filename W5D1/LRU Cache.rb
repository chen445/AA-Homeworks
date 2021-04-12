class LRUCache
    def initialize(n)
        @cache = []
        @max_size = n
        @used_at = []
        @curtime = 1
    end

    def count
      @cache.count 
    end

    def add(el)
        @curtime += 1
        if @cache.include?(el)
            @used_at[@cache.index(el)] = @curtime
        else
            if count < @max_size
                @cache << el
                @used_at << @curtime
            else
                min_i = least_used
                @cache[min_i] = el
                @used_at[min_i] = @curtime
            end
        end
    end

    def show
        ordered_elements = @cache.zip(@used_at).sort_by {|el, time| time}
        result = []
        ordered_elements.each do |el|
           result << el[0]
        end
        p result
    end

    private
    def least_used
        min_i = 0
        @used_at.each_with_index do |v, i|
            if v < @used_at[min_i]
                min_i = i
            end
        end
        return min_i
    end

  end

johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]