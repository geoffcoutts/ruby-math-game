#!/usr/bin/env ruby

require './game.rb'


puts "Welcome to a MATH EXTRAVAGANZA!!!"
puts "What is Player 1's name?"
player1 = gets.chomp
puts "What is Player 2's name?"
player2 = gets.chomp
puts "How many lives should each player get?"
lives = gets.chomp.to_i
puts = "LET'S PLAY!"

game = Game.new(player1, player2, lives)
game.run

puts "Thanks for playing."