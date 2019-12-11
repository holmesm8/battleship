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

  def welcome

    puts "Welcome to BATTLESHIP
    Enter p to play. Enter q to quit."

    print "> "
    pi = gets.chomp

      # @player_board = Board.new
      if pi.to_str.downcase == "p"

       puts "I have laid out my ships on the grid.\n"
       puts "You now need to lay out your two ships.\n"
       puts "The Cruiser is three units long and the Submarine is two units long.\n"
       puts @player_board.render(true)
       puts "Enter the squares for the Cruiser (3 spaces):"

      print ">"
      pi = gets.chomp.to_str.upcase.split(" ")

      else pi.to_str.downcase == "q"
       puts "GOODBYE"
      end

        coordinates = pi
        # require "pry"; binding.pry
        coordinates.map do |coord|
            # require "pry"; binding.pry
          if @player_board.valid_coordinate?(coord) && @player_board.valid_placement?(@cruiser_player, coordinates)
             @player_board.place(@cruiser_player, coordinates)
             # require "pry"; binding.pry
          else
            loop do
              puts "Invalid coordinates, please try again."
              # require "pry"; binding.pry
              puts ">"
              pi = gets.chomp
              coordinates = pi
              coordinates = pi.map do |coord|
                break if coord.valid_coordinate?(coordinates) && coord.valid_placement?(@cruiser_player, coordinates)
            end
          end
            @player_board.place(@cruiser_player, coordinates)
        end
      end
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
