class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    return @fired_upon
  end

  def fire_upon
    if @ship == nil
      @fired_upon = true
    else
      @ship.hit
      @fired_upon = true
    end
  end

  def render
    if fired_upon? == false
      return "."
    elsif fired_upon? == true && @ship == nil
      return "M"
    elsif fired_upon? == true && @ship != nil && @ship.health > 0
      return "H"
    else fired_upon? == true && @ship.health == 0
      return "X"
    end
  end

end




# if @s== nil
#   return "."
# else
#   false
