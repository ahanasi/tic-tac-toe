class Player
  attr_reader :name
  attr_accessor :move

  def initialize(name, move)
    @name = name
    @move = move
  end
end
