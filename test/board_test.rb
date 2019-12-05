require './lib/board'
require './lib/ship'
require './lib/cell'
require 'minitest/autorun'
require 'minitest/pride'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    # @cruiser = Ship.new("Cruiser", 3)
    # @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_attributes
    assert_instance_of Hash, @board.cells
    assert_equal 16, @board.cells.length
  end

  def test_it_has_a_valid_coordiante
    assert @board.valid_coordinate?("A1")
    refute @board.valid_coordinate?("E22")
  end


end
