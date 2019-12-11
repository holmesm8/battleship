class Turn

  def initialize

  end

  def start_game
    # render boards
      # cannot see computer player ship cells
    # player take shot
      # display result of take shot
      # check for win conditions against computer
    # computer take shot
      # display result of take shot
      # check for win conditions against human
    #
  end

  def render_boards
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
    require "pry"; binding.pry
  end

  def player_take_shot
    puts "Enter the coordinate for your shot :"
    player_shot = gets.chomp
    if @computer_board.valid_coordinate?(player_shot) && @computer_board.cells[player_shot].fired_upon?
      @computer_board.cells.[player_shot].fire_upon
    else
      loop do
        puts "Enter the coordinate for your shot :"
        player_shot = gets.chomp
        break if @computer_board.valid_coordinate?(player_shot) && @computer_board.cells[player_shot].fired_upon?
        puts "Invalid coordinate. Please enter a valid coordinate for your shot."
      end
    end
    @computer_board.cells(player_shot).fire_upon
    # valid coordinate?
      # gotta be on the board, fired_upon? already?
    # call fire_upon
    # are all computer ships sunk?
    # return result and board "Your shot on A4 was a miss."
  end

  def game_over?
  end

  def computer_take_shot?
    # valid coordinate?
      # gotta be on the board, fired_upon? already?
    # call fire_upon
    # are all computer ships sunk?
    # return result and board
  end

  def end_game
    puts "You won!"

    puts "I won!"

  end

end



Displaying the boards
Player choosing a coordinate to fire on
Computer choosing a coordinate to fire on
Reporting the result of the Player’s shot
Reporting the result of the Computer’s shot
