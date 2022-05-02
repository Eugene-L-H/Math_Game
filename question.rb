class Question
  attr_accessor :number1, :number2, :answer
  def initialize
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
  end

  def ask_question(player)
    puts "#{player.name} what does #{@number1} plus #{@number2} equal?"
  end

  def check_answer(input)
    return input == answer 
  end
end