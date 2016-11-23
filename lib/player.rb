class Player

attr_reader :hitpoint

def initialize
  @hitpoint = 60
end

  def name=(string)
    @name = string
  end

  def name
    @name
  end

  def reduce_hitpoint(number)
    raise "You can't reduce hitpoints and end up with more hitpoints" if number < 0
    @hitpoint -= number
  end
end
