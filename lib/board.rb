class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, coordinates_array)
    unless cell_unoccupied?(ship, coordinates_array) && coordinates_ship_length(ship, coordinates_array)
      return false
    end
    if consecutive_letters?(ship, coordinates_array) && same_numbers?(ship, coordinates_array)
      true
    elsif same_letters?(ship, coordinates_array) && consecutive_numbers?(ship, coordinates_array)
      true
    else
      false
    end
  end

  def cell_unoccupied?(ship, coordinates_array)
    coordinates_array.all? do |coord|
      @cells[coord].empty?
    end
  end

  def coordinates_ship_length(ship, coordinates_array)
    ship.length == coordinates_array.count
  end

  def same_numbers?(ship, coordinates_array)
    coordinates_array.all? { |coord| coord[-1] == coordinates_array[0][-1]}
  end

  def consecutive_numbers?(ship, coordinates_array)
    numbers = []
    coordinates_array.map { |coord| numbers << coord[-1].to_i == coordinates_array[0][-1]}
    numbers.each_cons(2).all? {|a, b| b == a + 1 }
  end

  def same_letters?(ship, coordinates_array)
    coordinates_array.all? { |coord| coord[0] == coordinates_array[0][0]}
  end

  def consecutive_letters?(ship, coordinates_array)
    letters = []
    coordinates_array.map { |coord| letters << coord[0] == coordinates_array[0][0]}
    (letters.first..letters.last).to_a == letters
  end

  def place(ship, coordinates_array)
    if cell_unoccupied?(ship, coordinates_array) == false
      return false
    else coordinates_array.each { |coords| @cells[coords].place_ship(ship)}
    end
  end

  def render(ship = false)

# this is printing every spot as an S and I'm not sure why
      "  1 2 3 4 \n" +
      "A #{["A1", "A2", "A3", "A4"].map { |coords| @cells[coords].render(ship)}.join(" ")} \n" +
      "B #{["B1", "B2", "B3", "B4"].map { |coords| @cells[coords].render(ship)}.join(" ")} \n" +
      "C #{["C1", "C2", "C3", "C4"].map { |coords| @cells[coords].render(ship)}.join(" ")} \n" +
      "D #{["D1", "D2", "D3", "D4"].map { |coords| @cells[coords].render(ship)}.join(" ")} \n"
  end
end
