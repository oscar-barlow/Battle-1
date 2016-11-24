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

  def active_player
    fail "Cannot have two active players" if both_players_active?
    fail "Cannot have two inactive players" if both_players_inactive?
    @player1.check_active ? @player1 : @player2
  end

  def inactive_player
    @player1.check_active ? @player2 : @player1
  end

  def switch_active_player
    @player1.switch_active
    @player2.switch_active
  end

  private

  def both_players_active?
    @player1.check_active && @player2.check_active
  end

  def both_players_inactive?
    !@player1.check_active && !@player2.check_active
  end

end
