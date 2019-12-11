require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @computer_board = Board.new
    @player_board = Board.new
    @cruiser_computer = Ship.new("Cruiser", 3)
    @submarine_computer = Ship.new("Submarine", 2)
    @cruiser_player = Ship.new("Cruiser", 3)
    @submarine_player = Ship.new("Submarine", 2)
  end

  def test_it_exists

    assert_instance_of Game, @game
  end

  def test_it_starts
    assert @game.welcome
    assert @game.user_place_ships(@crusier_player.length)

  end

#   def test_user_can_place_ships
#     assert @game.user_place_ships(@submarine_player.length)
# require "pry"; binding.pry



  # def test_it_has_attributes
  #   assert_equal @computer_board = Board.new
  #   assert_equal @player_board = Board.new
  #   assert_equal @cruiser_computer = Ship.new("Cruiser", 3)
  #   assert_equal @submarine_computer = Ship.new("Submarine", 2)
  #   assert_equal @cruiser_player = Ship.new("Cruiser", 3)
  #   assert_equal @submarine_player = Ship.new("Submarine", 2)
  # end



  # def test_computer_can_randomly_pick_coordinates
  #   @game.place_computer_ships
  #
  #   assert_equal 3, @computer_board.render(true)
  #   # assert @computer_board.cells.ship.include?(@submarine_computer)
  #   # assert @computer_board!!!.cells.ship.include?(@cruiser_computer)
  # end



end
