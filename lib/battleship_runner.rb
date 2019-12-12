require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'



  game = Game.new
  game.initialize_new_game
  game.welcome
  game.gameplay
