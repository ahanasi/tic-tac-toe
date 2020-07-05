class Board
  attr_accessor :board

  def initialize()
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def printb()
    puts "\n\n"
    puts "#{@board[0]}    |  #{@board[1]}   |   #{@board[2]}"
    puts "-------------------"
    puts "#{@board[3]}    |  #{@board[4]}   |   #{@board[5]}"
    puts "-------------------"
    puts "#{@board[6]}    |  #{@board[7]}   |   #{@board[8]}"
  end

  def valid_position(position)
    @board[position - 1].kind_of?(Integer)
  end

  def place_marker(marker, num)
    until valid_position(num)
      puts "Please choose an unoccupied number position to place your marker at"
      num = gets.chomp.to_i
    end
    @board[num - 1] = marker
  end

  def victory_condition()
    vc = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    vc.each do |a, b, c|
      if @board[a] == @board[b] && board[b] == @board[c]
        return true
      end
    end
    return false
  end

  def draw_condition()
    @board.all? { |cell| cell.kind_of?(String) }
  end
end
