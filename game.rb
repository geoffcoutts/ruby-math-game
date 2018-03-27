require 'byebug'
require './player.rb'
require './turn_manager.rb'
require './question.rb'

class Game

  attr_accessor :players, :turn

  def initialize(player1, player2, lives)
    p1 = Player.new(player1, lives)
    p2 = Player.new(player2, lives)

    @turn = TurnManager.new([p1, p2])
  end

  def game_over?
    @turn.contestants < 2
  end

  def run
    until game_over?
      current_player = @turn.current_player
      puts "It's your turn #{current_player.name}"

      @q = Question.new
      puts "Your question is: #{@q.question} ?"
      puts @q.answer

      user_answer = gets.chomp.to_i

      if @q.compare_answer?(user_answer)
        puts "Correct!"
        @turn.next_turn
      else
        current_player.lose_life
        puts "Wrong! You lose 1 life."
        puts "You now have #{current_player.lives}."


        @turn.next_turn
        if current_player.lose_game?
          @turn.remove_current_player
        end
      end

    end

    puts "Congratulations #{current_player.name}! You win!"
    # puts @turn.current_player.name
  end
end