require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_has_attributes
    computer = Computer.new

    assert_equal [], computer.ships
  end

  def test_it_can_add_ships
    computer = Computer.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal [cruiser], computer.add_ships(cruiser)
    assert_equal [cruiser, submarine], computer.add_ships(submarine)
  end
end
