# manages player interactions

class Game

  attr_reader :players

  def initialize(first_player, second_player)
    @players = [first_player, second_player]
  end

  def attack(attackee)
    attackee.reduce_hitpoints(10)
  end

end
