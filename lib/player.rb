class Player
  attr_reader :name
  attr_accessor :health

  def initialize(name)
    @name = name
    @health = 100
  end

  def received_damage(life = 10)
    @health -= life
  end

  def attack(player)
    player.health -= 10
  end

end
