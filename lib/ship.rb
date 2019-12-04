class Ship

  attr_reader :name, :length, :health
  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
    @sunk = false
  end

  def sunk?
    if @sunk == false
      false
    else
      true
    end
  end

  def hit
    @health -= 1
    if @health == 0
      @sunk = true
    end
  end




end
