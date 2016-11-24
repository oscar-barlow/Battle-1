class Player
  attr_reader :name, :active
  attr_accessor :health


  DEFAULT_HEALTH = 100
  DEFAULT_DAMAGE = 10

  def initialize(name, health = DEFAULT_HEALTH, active=false)
    @name = name
    @health = health
    @active = active
  end

  def receive_damage(life = DEFAULT_DAMAGE)
    @health -= life
  end

  def attack(player)
    player.receive_damage
  end

  def switch_active
    check_active ? @active = false : @active = true
  end

  def check_active
    @active
  end

end
