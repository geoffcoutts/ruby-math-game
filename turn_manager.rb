class TurnManager

  attr_accessor :players

  def initialize(players)
    @players = players.dup.shuffle
  end

  def current_player
    @players.first
  end

  def next_turn
    @players.rotate!
  end

  def contestants
    @players.length
  end

  def remove_current_player
    @players.shift
  end
end