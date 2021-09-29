
    require_relative '../lib/game.rb'
    

    def continue_playing?(response)
        if response == '1'
            false
        elsif response == '2'
            true
        end
    end

    stop_playing = false

    while stop_playing == false do
        print "Player 1, please enter your name:"
        player_one = gets.chomp
        puts ""
        print "Player 2, please enter your name:"
        player_two = gets.chomp

        game = Game.new(player_one, player_two)
        game.play_game
        response = nil
        while response != 1 && response != 2 do 
        puts 'Please enter 2 if you would like to keep playing or 1 if you would like to stop.'
        response = gets.chomp
        end
        continue_playing?(response)
    end