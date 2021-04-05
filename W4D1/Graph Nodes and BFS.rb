require 'set'

class GraphNode
    attr_accessor :value, :neighbors
    def initialize(value)
        self.value = value
        self.neighbors = []
    end 

end 

def bfs(staring_node,target_value)
    visited = Set.new()
    arr =[staring_node]
    while !arr.empty?
        el = arr.shift
        visited.add(el)
        if el.value == target_value
            return el 
        else 
            el.neighbors.each do |neighbor|
                if !visited.include?(neighbor)
                    arr << neighbor
                end 
            end
        end  
    end 
    return nil 
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a,"b")
p bfs(a, "f")