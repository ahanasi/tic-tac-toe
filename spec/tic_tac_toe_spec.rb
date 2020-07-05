require "./lib/board.rb"
require "./lib/main.rb"
require "./lib/player.rb"

describe Board do
  describe "#valid_position" do
    it "checks if board position is occupied by an integer (1-9)" do
      board = Board.new()
      expect(board.valid_position(3)).to be true
    end
  end

  describe "#place_marker" do
    it "places marker onto selected position on board" do
      board = Board.new()
      expect(board.place_marker("X",2)).to eql(board.board[1])
    end
  end

  describe "#victory_condition" do
    it "check for victory condition" do
      board = Board.new()
      expect(board.victory_condition()).to be false

      (0..2).each { |i| board.board[i] = "X" }
      expect(board.victory_condition()).to be true
    end
  end

  describe "#draw_condition" do
    it "check for draw condition" do
      board = Board.new()
      expect(board.draw_condition()).to be false

      (0..2).each { |i| board.board[i] = "X" }
      expect(board.draw_condition()).to be false

      (0..9).each { |i| board.board[i] = "X" }
      expect(board.draw_condition()).to be true
    end
  end
end

describe TicTacToe do
  describe "#choose_marker" do
    it "assigns marker for player2 based on player1's selection" do
      game = TicTacToe.new(Board.new(), Player.new("A"), Player.new("B"))
      game.player1.marker = "X"
      expect(game.choose_marker()).to eql("O")

      game.player1.marker = "O"
      expect(game.choose_marker()).to eql("X")
    end
  end
end
