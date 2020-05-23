class Board
  attr_accessor :board

  def initialize()
    @board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
  end

  def printb()
    @board.each_cons(1) {|a,b,c| puts "#{a}  #{b}  #{c}\n"}
  end

end
