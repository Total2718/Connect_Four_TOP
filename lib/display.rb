
class GameDisplay
    attr_accessor :current_symbol
    def initialize(game_board, player_one, player_two)
        @game_board = game_board 
        @player_one = player_one
        @player_two = player_two
        @current_symbol = 'B'
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
    end

end