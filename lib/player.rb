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
    @hitpoint -= number
  end
end
