class Game

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def attack(player)
    player.receive_damage
  end

  def switch_active_player
    @player1.switch_active
    @player2.switch_active
  end

  def player1_active?
    @player1.check_active
  end

end
