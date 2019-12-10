require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/human'

class HumanTest < Minitest::Test

  def test_it_exists
    human = Human.new

    assert_instance_of Human, human
  end

  def test_it_has_attributes
    human = Human.new

    assert_equal [], human.ships
  end

  def test_it_can_add_ships
    human = Human.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal [cruiser], human.add_ships(cruiser)
    assert_equal [cruiser, submarine], human.add_ships(submarine)
  end
end
