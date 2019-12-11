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
    coordinates = gets.chomp

    # @player_board = Board.new
    if coordinates.to_str.downcase == "p"

      puts "I have laid out my ships on the grid.\n"
      puts "You now need to lay out your two ships.\n"
      puts "The Cruiser is three units long and the Submarine is two units long.\n"
      puts @player_board.render(true)
      puts "Enter the squares for the Cruiser (3 spaces):"

      print ">"
      coordinates = gets.chomp.upcase.split(" ")

    else coordinates.to_str.downcase == "q"
      puts "GOODBYE"
    end

    place_player_cruiser(coordinates)

    puts @player_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    print ">"

    coordinates = gets.chomp.upcase.split(" ")

    place_player_submarine(coordinates)

    place_computer_ships

    puts "=============COMPUTER BOARD============="
    puts @computer_board.render(true)
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)

    puts "Pick coordinates to fire at a ship."
    puts ">"
    coordinate = gets.chomp.upcase

    place_player_shot(coordinate)

    place_computer_shot

    puts @player_board.render(true)

    puts @computer_board.render(true)


  end

  def place_computer_shot
    coordinate = @player_board.cells.keys.sample
    until @player_board.valid_coordinate?(coordinate) && !@player_board.cells[coordinate].fired_upon?
      coordinate = @player_board.cells.keys.sample
    end
    @player_board.cells[coordinate].fire_upon
  end

  def place_player_shot(coordinate)
    until @computer_board.valid_coordinate?(coordinate) && !@computer_board.cells[coordinate].fired_upon?
      puts "Invalid coordinates, please try again."
      puts ">"
      coordinate = gets.chomp.upcase
    end
    @computer_board.cells[coordinate].fire_upon
  end


  def place_player_cruiser(coordinates)
    until coordinates.all? { |coord| @player_board.valid_coordinate?(coord) } \
      && @player_board.valid_placement?(@cruiser_player, coordinates)
      puts "Invalid coordinates, please try again."
      puts ">"
      coordinates = gets.chomp.upcase.split(" ")
    end
    @player_board.place(@cruiser_player, coordinates)
  end

  def place_player_submarine(coordinates)
    until coordinates.all? { |coord| @player_board.valid_coordinate?(coord) } \
      && @player_board.valid_placement?(@submarine_player, coordinates)
      puts "Invalid coordinates, please try again."
      puts ">"
      coordinates = gets.chomp.upcase.split(" ")
    end
    @player_board.place(@submarine_player, coordinates)
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

  coordinates2 = []
    coordinates2 = @computer_board.cells.keys.sample(@cruiser_computer.length)
    if @computer_board.valid_placement?(@cruiser_computer, coordinates2)
      @computer_board.place(@cruiser_computer, coordinates2)
    else
      loop do
        coordinates2 = @computer_board.cells.keys.sample(@cruiser_computer.length)
        break if @computer_board.valid_placement?(@cruiser_computer, coordinates2)
      end
    end
    @computer_board.place(@cruiser_computer, coordinates2)
  end
end
