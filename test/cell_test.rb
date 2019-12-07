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

  def test_it_can_be_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal false, cell.fired_upon?

    cell.place_ship(cruiser)
    cell.fire_upon

    assert cell.fired_upon?
    assert_equal 2, cell.ship.health

  end

  def test_it_can_render_every_option
    cell_1 = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell_2 = Cell.new("C3")

    assert_equal ".", cell_1.render
    cell_1.fire_upon
    assert_equal "M", cell_1.render
    cell_2.place_ship(cruiser)
    assert_equal "S", cell_2.render(true)
    cell_2.fire_upon
    assert_equal "H", cell_2.render(true)
    cell_2.fire_upon
    refute cruiser.sunk?
    cell_2.fire_upon
    assert_equal "X", cell_2.render(true)
  end

end
