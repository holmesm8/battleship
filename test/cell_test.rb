# pry(main)> require './lib/ship'
# # => true
#
# pry(main)> require './lib/cell'
# # => true
#
# pry(main)> cell = Cell.new("B4")
# # => #<Cell:0x00007f84f0ad4720...>
#
# pry(main)> cell.coordinate
# # => "B4"
#
# pry(main)> cell.ship
# # => nil
#
# pry(main)> cell.empty?
# # => true
#
# pry(main)> cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0891238...>
#
# pry(main)> cell.place_ship(cruiser)
#
# pry(main)> cell.ship
# # => #<Ship:0x00007f84f0891238...>
#
# pry(main)> cell.empty?
# # => false
#
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

class CellTest < Minitest::Test

  def test_cell_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_attributes
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
    assert_nil cell.ship

  end

  def test_cell_is_empty
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
  end

  def test_place_ship_in_empty_cell
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_nil cell.ship

    cell.place_ship(cruiser)

    assert_equal cruiser, cell.ship
    assert_equal false, cell.empty?
  end

end
