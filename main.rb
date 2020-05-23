require 'position.rb'
require "player.rb"
require "board.rb"

class TicTacToe
  attr_reader :game

  def initialize(game)
    @game = game
  end
end

