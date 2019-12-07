require './lib/board'
require './lib/ship'
require './lib/cell'
require 'minitest/autorun'
require 'minitest/pride'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
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

  def test_it_has_a_valid_placement

    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "B1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_cell_is_unoccupied

    assert_equal true, @board.cell_unoccupied?(@cruiser, ["A1", "A2", "A3"])
  end

  def test_ship_length_matches_coordinates_number

    assert_equal true, @board.coordinates_ship_length(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.coordinates_ship_length(@cruiser, ["A1", "A2", "A3", "A4"])
  end

  def test_numbers_are_the_same

    assert_equal true, @board.same_numbers?(@cruiser, ["A1", "B1", "C1"])
    assert_equal true, @board.same_numbers?(@submarine, ["A3", "B3"])
    assert_equal false, @board.same_numbers?(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.same_numbers?(@submarine, ["A1", "A3"])
  end

  def test_numbers_are_consecutive

    assert_equal false, @board.consecutive_numbers?(@cruiser, ["A1", "B1", "C1"])
    assert_equal false, @board.consecutive_numbers?(@submarine, ["A3", "B3"])
    assert_equal true, @board.consecutive_numbers?(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.consecutive_numbers?(@submarine, ["A1", "A3"])
  end

  def test_letters_are_the_same

    assert_equal false, @board.same_letters?(@cruiser, ["A1", "B1", "C1"])
    assert_equal false, @board.same_letters?(@submarine, ["A3", "B3"])
    assert_equal true, @board.same_letters?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.same_letters?(@submarine, ["A1", "A3"])
  end

  def test_letters_are_consecutive

    assert_equal true, @board.consecutive_letters?(@cruiser, ["A1", "B1", "C1"])
    assert_equal true, @board.consecutive_letters?(@submarine, ["A3", "B3"])
    assert_equal false, @board.consecutive_letters?(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.consecutive_letters?(@submarine, ["A1", "A3"])
  end

  def test_it_can_be_placed

    refute @board.cells["A1"].ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal @cruiser, @board.cells["A1"].ship
    @board.place(@submarine, ["A3", "B3"])
    assert_equal @cruiser, @board.cells["A3"].ship
  end

  def test_it_can_render_a_board

    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @board.render
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", @board.render(true)
  end
end
