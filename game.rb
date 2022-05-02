# require './player.rb' 

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @gameplay = true
  end

  def start_game
    puts "Welcome #{@player1.name} and #{@player2.name}, let's flex those math-muscles!"
  end

  def check_lives
    puts "#{@player1.name} has #{@player1.lives} #{@player1.lives > 1 ? 'lives' : 'life'} and #{@player2.name} has #{@player2.lives} #{@player2.lives > 1 ? 'lives' : 'life'}"
  end

  def game_loop
    # Initialize game
    start_game
    
    # Begin gameplay loop
    @player_turn = 1
    while @gameplay do
      question = Question.new
      current_player = player_turn = 1 ? @player1 : @player2

       question.ask_question(current_player)
    end
  end

end