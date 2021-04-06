class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new([])}
    self.place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    (0...14).each do |i|
      if i !=6 && i !=13
        cups[i]+=[:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup"
    end

    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end 
  end

  def make_move(start_pos, current_player_name)
    i = 1
    while !cups[start_pos].empty?
      if (start_pos+i)%14 == 6
        @cups[6] << cups[start_pos].pop if current_player_name == @name1
      elsif (start_pos+i)%14 == 13
        @cups[13] << cups[start_pos].pop if current_player_name == @name2
      else
        @cups[(start_pos+i)%14] << cups[start_pos].pop
      end
      i+=1
    end 

    render
    next_turn((start_pos+i-1)%14)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
     @cups[0..6].all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}

  end

  def winner
    name2_s = @cups[13].length
    name1_s = @cups[6].length
    if name1_s > name2_s
      @name1
    elsif name1_s < name2_s
      @name2
    else 
      :draw
    end

  end
end
