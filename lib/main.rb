require_relative "board.rb"
require_relative "player.rb"
require "pry"

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
    while 1
      begin
        player.position = Kernel.gets.chomp.match(/^[1-9]$/)[0].to_i
      rescue NoMethodError
        puts "Please choose a number position on the board"
      else
        break
      end
    end
    @board.place_marker(player.marker, player.position)
    @board.printb
  end
end

# Gameplay

def driver

  board = Board.new()
is_player2 = false

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
board.printb

until (board.victory_condition() || board.draw_condition())
  player = is_player2 ? player2 : player1
  new_game.play_round(player)
  is_player2 = !is_player2
end

if board.draw_condition
  puts "It's a draw!"
else
  puts "#{player.name} wins!"
end


end

