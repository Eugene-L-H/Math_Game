class Player
  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def lose_life
    @lives - 1
  end

end