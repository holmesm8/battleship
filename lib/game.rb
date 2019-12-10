require './lib/board'
require './lib/ship'
require './lib/cell'

class Game

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    @cruiser_computer = Ship.new("Cruiser", 3)
    @submarine_computer = Ship.new("Submarine", 2)
    @cruiser_player = Ship.new("Cruiser", 3)
    @submarine_player = Ship.new("Submarine", 2)
  end
  
  def place_computer_ships
    coordinates = []
    coordinates = @computer_board.cells.keys.sample(@submarine_computer.length)
    if @computer_board.valid_placement?(@submarine_computer, coordinates)
      @computer_board.place(@submarine_computer, coordinates)
    else
      loop do
        coordinates = @computer_board.cells.keys.sample(@submarine_computer.length)
        break if @computer_board.valid_placement?(@submarine_computer, coordinates)
      end
    end
    @computer_board.place(@submarine_computer, coordinates)
  end
end

# def start_game
#   "Welcome to BATTLESHIP\n" +
#   "Enter p to play. Enter q to quit.\n"
#   choice = gets.chomp
#
#   if choice.to_s.downcase == "p"
#    "Ready"
#   elsif choice.to_s.downcase == "q"
#    "Goodbye"
#   else
#    "Invalid entry. Enter p to play. Enter q to quit."
#   end
# end
