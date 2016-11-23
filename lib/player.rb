class Player
  attr_reader :name
  attr_accessor :health

  DEFAULT_HEALTH = 100
  DEFAULT_DAMAGE = 10

  def initialize(name, health = DEFAULT_HEALTH)
    @name = name
    @health = health
  end

  def receive_damage(life = DEFAULT_DAMAGE)
    @health -= life
  end

  def attack(player)
    player.receive_damage
  end

end
