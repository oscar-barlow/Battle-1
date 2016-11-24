class Game

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @player1.switch_active
  end

  def attack(player)
    player.receive_damage
  end

  private

  def switch_active_player
    @player1.switch_active
    @player2.switch_active
  end

end
