CLASSES --> Player, Game, TurnManager

  Player
    attr_accessor :lives

    initialize:

    Manages a player's lives

  Game
    attr_reader :players

    Asks questions
    Takes answer from player


  Question
    attr_accessor :question :answer

    initialize: one float, one int

    Generates question
    Passes it to Game
    Compares against answer from Player in Game

  TurnManager


    Alternates player turns