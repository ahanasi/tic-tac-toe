require "/home/ahanasi/the_odin_project/tic-tac-toe/board.rb"
require "/home/ahanasi/the_odin_project/tic-tac-toe/player.rb"

class TicTacToe
  attr_accessor :player1, :player2, :board

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def choose_marker()
    @player2.marker = (@player1.marker == "X") ? "O" : "X"
  end

  def play_round(player)
    puts "#{player.name}, choose a number positon on the board to place your marker at."
    player.position = gets.chomp.to_i
    @board.place_marker(player.marker, player.position)
    @board.printb
  end
end

# Gameplay

board = Board.new()

puts "Hi! Welcome to Tic Tac Toe!"
puts "Player 1, identify yourself!"
player1 = Player.new(gets.chomp)

while 1
  puts "Choose your weapon: X or O"
  begin
    player1.marker = Kernel.gets.chomp.upcase.match(/^[X]$|^[O]$/)[0]
  rescue NoMethodError
    puts "Please choose either X or O"
    puts "\tTry again...\n"
  else
    break
  end  
end
puts "Player 2, please enter your name: "
player2 = Player.new(gets.chomp)

new_game = TicTacToe.new(board, player1, player2)
new_game.choose_marker()

puts "Awesome! #{player2.name}, you'll play with #{player2.marker}. Let's get started!"

is_player2 = false

until (board.victory_condition())
  player = is_player2 ? player2 : player1
  board.printb
  new_game.play_round(player)
  is_player2 = !is_player2
end

puts "#{player.name} wins!"
