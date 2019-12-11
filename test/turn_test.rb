require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/turn'
require 'minitest/autorun'
require 'minitest/pride'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new

    assert_instance_of Turn, turn
  end

  def computer_take_shot
    skip
    shot_count = 0
    board.map do |cell|
      if cell.fired_upon?
        shot_count += 1
      end

    assert_equal 1, shot_count
  end

end
