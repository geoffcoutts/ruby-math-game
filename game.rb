require 'byebug'
require './player.rb'
require './turn_manager.rb'
require './question.rb'

class Game

  attr_accessor :players, :turn

  def initialize
    p1 = Player.new('Player 1')
    p2 = Player.new('Player 2')

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
        @turn.next_turn
      else
        puts current_player.lives
        current_player.lose_life
        puts current_player.lives

        if current_player.lose_game?
          @turn.remove_current_player
        end
      end

      @turn.next_turn
    end

    puts "Congratulations #{current_player.name}! You win!"
    # puts @turn.current_player.name
  end
end