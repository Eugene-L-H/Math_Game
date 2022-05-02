# require './player.rb' 

class Game
  def initialize
    @player1 = Player.new("Player ONE")
    @player2 = Player.new("Player TWO")
  end
  
  def start_game
    puts "Welcome #{@player1.name} and #{@player2.name}, let's flex those math-muscles!"
  end
  
  def check_lives
    if @player1.lives == 0 or @player2.lives == 0
      if @player1.lives == 0
        puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
        puts '----- GAME OVER ------'
        return 1
      else
        puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
        puts '----- GAME OVER ------'
        return 1
      end
    end
    
    puts "#{@player1.name} has (#{@player1.lives}) #{@player1.lives > 1 ? 'lives' : 'life'} and #{@player2.name} has (#{@player2.lives}) #{@player2.lives > 1 ? 'lives' : 'life'}"
  end
      
  def game_loop
    # Initialize game
    start_game

    # Gameplay loop will continue until @gameplay is false
    @gameplay = true 
    
    # Begin gameplay loop
    @player_turn = 1
    while @gameplay do
      question = Question.new

      correct_answer = question.answer
      correct_msg = "Yes! #{question.number1} plus #{question.number2} does equal #{correct_answer}"

      current_player = @player_turn == 1 ? @player1 : @player2

      question.ask_question(current_player)
      print '> '

      @user_answer = $stdin.gets.chomp

      if @user_answer.to_i == correct_answer
        puts correct_msg
      else 
        current_player.lose_life
        puts "Incorrect."
      end

      # Change the player
      @player_turn == 1 ? @player_turn = 2 : @player_turn = 1
      
      # Check lives if one of the players has no lives left
      life_check = check_lives
      if life_check == 1
        @gameplay = false;
      end

    end

  end

end