class Question

  attr_reader :num1, :num2
  attr_accessor :operation, :question, :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @operation = choose_operation
    @question = make_question
    @answer = set_answer
  end

  def choose_operation
    @operation = ["+", "-", "*"].sample
  end

  def make_question
    @question = "#{@num1} #{@operation} #{@num2} ="
  end

  def set_answer
    case @operation
    when "+"
      @answer = @num1 + @num2
    when "-"
      @answer = @num1 - @num2
    when "*"
      @answer = @num1 * @num2
    # when "/"
    #   @answer = @num1 / @num2
    end
  end

  def compare_answer?(user_answer)
    @answer == user_answer
  end

end

