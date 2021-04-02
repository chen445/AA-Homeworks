class Queue
    def initialize
        @storage = [] 
    end 

    def enqueue(el)
        @storage << el  
    end 

    def dequeue
        @storage.shift
    end 

    def peek
        @storage[0]
    end 
end 

