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

b = Stack.new
p b.push("cook")
p b.pop
p b 
b.push("cook")
b.push("icecream")
b.push("pizza")
b.push("rice")
b.pop
p b
p b.peek
p b

