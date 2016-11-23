class Game

  attr_reader :players

  def initialize(first_player, second_player)
    @players = [first_player, second_player]
  end

end
