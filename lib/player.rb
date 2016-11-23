class Player
  attr_reader :name, :health

  def initialize(name)
    @name = name
    @health = 100
  end

  def deduct_life(life = 10)
    @health -= life
  end

end
