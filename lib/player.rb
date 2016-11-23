# manages hitpoints

class Player

attr_reader :hitpoints

def initialize
  @hitpoints = 60
end

  def name=(string)
    @name = string
  end

  def name
    @name
  end

  def attack(player)
    player.reduce_hitpoints(10)
  end

  def reduce_hitpoints(number)
    raise "You can't reduce hitpoints and end up with more hitpoints" if number < 0
    @hitpoints -= number
  end
end
