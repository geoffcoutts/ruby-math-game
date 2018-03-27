class Player

  attr_accessor :name, :lives

  def initialize(name, lives)
    @name = name
    @lives = lives
  end

  def lose_life
    @lives -= 1
  end

  def lose_game?
    @lives <= 0
  end
end