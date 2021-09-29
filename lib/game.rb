
 require_relative '../lib/display.rb'

class Game
        attr_accessor :symbol
    def initialize(player_one, player_two)
        @player_one = player_one
        @player_two = player_two
        @game_over = false
        @symbol = 'B'
        @game_board = Array.new(7) {Array.new(6, '-')}
        @display = GameDisplay.new(@game_board, @player_one, @player_two)
    end

    def play_game 
        @display.explain_game
        while @game_over == false  do
            switch_player
            column_choice = player_choose
            update_board(column_choice.to_i)
            @display.update_display(@game_board)
            @game_over = check_win
        end

    end

    def player_choose
        valid_choice = false
        while valid_choice == false 
            @display.player_choose_script
            column_choice = take_column_choice
            valid_choice = verify_column(column_choice)
            column_choice 
        end

    end

    def take_column_choice
        gets.chomp
    end

    def update_board(column_choice)
        slot_counter = 0
        @game_board[column_choice - 1].each do |current_slot|
            slot_counter += 1 if current_slot != '-'
        end
        @game_board[column_choice - 1][slot_counter] = @symbol
    end

    def switch_player 
        if @symbol == 'R'
            @symbol = 'B'
        elsif @symbol == 'B'
            @symbol = 'R'
        end
        @display.switch_symbol(@symbol)
    end

    def check_win
        #vertical win
        result = false
        if result == false
            current_column = 0
            7.times do
                starting_row = 0
                3.times do 
                    n = 0 
                    connect_counter = 0
                    4.times do 
                        spot = @game_board[current_column][starting_row + n]
                        connect_counter += 1 if spot == @symbol
                        n += 1
                    end
                    result = true if connect_counter == 4
                    starting_row += 1
                end
                current_column += 1
            end
        end

        if result == false
            current_row = 0
            6.times do 
                starting_column = 0
                4.times do
                    n = 0 
                    connect_counter = 0
                    4.times do 
                        spot = @game_board[starting_column + n][current_row]
                        connect_counter += 1 if spot == @symbol
                        n += 1
                    end
                    result = true if connect_counter == 4
                    starting_column += 1
                end
                current_row += 1
            end
        end

        if result == false

            starting_column = 0
            4.times do 
                starting_row = 0
                3.times do
                    n = 0
                    connect_counter = 0
                    4.times do
                        spot = @game_board[starting_column + n][starting_row + n]
                        connect_counter += 1 if spot == @symbol
                        n += 1
                    end
                    result = true if connect_counter == 4
                    starting_row += 1
                end
                starting_column += 1
            end

        end

        if result == false

            starting_column = 0
            4.times do
                starting_row = 6
                3.times do
                    n = 0 
                    connect_counter = 0
                    4.times do 
                        spot = @game_board[starting_column + n][starting_row - n]
                        connect_counter += 1 if spot == @symbol
                        n += 1
                    end
                    result = true if connect_counter == 4
                    starting_row -= 1
                end
                starting_column += 1

            end

        end

        if result == false
            columns_full = 0
            @game_board.each do |column| 
                filled_counter = 0 
                column.each do |slot| 
                    filled_counter += 1 if slot != '-'
                end
                columns_full += 1 if filled_counter == 6
            end
            result = true if columns_full == 7
        end
        result
    end

    def verify_column(column_choice)
        full = nil
        if column_choice.length == 1
            if column_choice.ord >= 49 && column_choice.ord <= 55
                column_full = 0
                @game_board[column_choice.to_i - 1].each do |spot|
                    (column_full += 1) if (spot == 'B' || spot == 'R')
                end
                column_full == 6 ? false : true
                
            else
                false
            end
        else
            false
        end
    end
end