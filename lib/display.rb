
class GameDisplay
    attr_accessor :current_symbol
    def initialize(game_board, player_one, player_two)
        @game_board = game_board 
        @player_one = player_one
        @player_two = player_two
        @current_symbol = 'B'
        @current_player = @player_one
    end

    def update_display(game_board)
        @game_board = game_board
    end

    def show_current_display 

        puts <<-board

        Column:     1       2       3       4       5       6       7

                |   #{@game_board[0][5]}   |   #{@game_board[1][5]}   |   #{@game_board[2][5]}   |   #{@game_board[3][5]}   |   #{@game_board[4][5]}   |   #{@game_board[5][5]}   |   #{@game_board[6][5]}   |
                ----------------------------------------------------------
                |   #{@game_board[0][4]}   |   #{@game_board[1][4]}   |   #{@game_board[2][4]}   |   #{@game_board[3][4]}   |   #{@game_board[4][4]}   |   #{@game_board[5][4]}   |   #{@game_board[6][4]}   |
                ----------------------------------------------------------
                |   #{@game_board[0][3]}   |   #{@game_board[1][3]}   |   #{@game_board[2][3]}   |   #{@game_board[3][3]}   |   #{@game_board[4][3]}   |   #{@game_board[5][3]}   |   #{@game_board[6][3]}   |
                ----------------------------------------------------------
                |   #{@game_board[0][2]}   |   #{@game_board[1][2]}   |   #{@game_board[2][2]}   |   #{@game_board[3][2]}   |   #{@game_board[4][2]}   |   #{@game_board[5][2]}   |   #{@game_board[6][2]}   |
                ----------------------------------------------------------
                |   #{@game_board[0][1]}   |   #{@game_board[1][1]}   |   #{@game_board[2][1]}   |   #{@game_board[3][1]}   |   #{@game_board[4][1]}   |   #{@game_board[5][1]}   |   #{@game_board[6][1]}   |
                ----------------------------------------------------------
                |   #{@game_board[0][0]}   |   #{@game_board[1][0]}   |   #{@game_board[2][0]}   |   #{@game_board[3][0]}   |   #{@game_board[4][0]}   |   #{@game_board[5][0]}   |   #{@game_board[6][0]}   |
                ----------------------------------------------------------


        board
    end

    def switch_symbol(symbol)
        @current_symbol = symbol
        #player one is red 'R'
        #player two is blue 'B'
        if symbol == 'B'
            @current_player = @player_two
        elsif symbol == 'R'
            @current_player = @player_one
        end
        
    end

    def explain_game
        puts <<-explain

            Welcome to Connect 4. This is a two player game that involves some gameplay similar to Tic-Tac-Toe. The goal of 
        the game is to make a 4 piece long sequence out your respective game pieces. #{@player_one}, you will be using the 
        red pieces denoted by the capital 'R' on them. #{@player_two}, you will be using the blue pieces denoted by the 
        capital 'B' on them. The board upon which you will make the sequence can only be changed by inserting the pieces in 
        a partiular way. The board is made up of 7 columns and 6 rows for a total of 42 slots. The only way that pieces
        may be placed on the board is by dropping them in from above into the columns. Starting from the bottom the pieces 
        may be accumulated. To get a piece in a particular slot, the slots below it must be filled so that it lands on top. 
        The sequence you will be attempting to make can be in a vertical, horizontal, or diagonal fashion. Feel free to 
        strategically place pieces in order to block your opponent or to help create opportunities fo yourself. That is all 
        there is to it. May the best player win!


        explain
        
        press_enter_to_continue
    end

    def press_enter_to_continue
        puts 'Press Enter to Continue'
        skip = gets
    end

    def player_choose_script

        puts <<-script
            #{@current_player}please select a column that isn't filled by entering in the single digit by itself: 
        script
    end



end