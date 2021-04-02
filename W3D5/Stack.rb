class Stack
    def initialize
      @storage=[]
    end

    def push(el)
      @storage << el
    end

    def pop
      @storage.pop
    end

    def peek
      return @storage[-1]
    end
    
    def inspect
        @storage.inspect
    end
end


