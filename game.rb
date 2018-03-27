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
    puts "\n\nLET'S PLAY!\n\n"

    until game_over?
      current_player = @turn.current_player
      puts "It's your turn, #{current_player.name}. You have #{current_player.lives} lives."

      @q = Question.new
      puts "Your question is: #{@q.question} ?"
      puts @q.answer

      user_answer = gets.chomp.to_i

      if @q.compare_answer?(user_answer)
        puts "\nCorrect!\n\n"
        @turn.next_turn
      else
        current_player.lose_life
        puts "\nWrong! You lose 1 life."
        puts "You now have #{current_player.lives}.\n\n"

        if current_player.lose_game?
          puts "You lose!"
          @turn.remove_current_player
        else
          @turn.next_turn
        end
      end

    end
    puts "Congratulations, #{turn.players[0].name}! You win!"
    # puts @turn.current_player.name
  end
end