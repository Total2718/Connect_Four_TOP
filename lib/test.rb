game_board = Array.new(7) {Array.new(6, 'R')}
game_board[1] = ['R', 'B', 'R', 'B', 'R', 'B']


puts puts <<-board

Column:     1       2       3       4       5       6       7

        |   #{game_board[0][5]}   |   #{game_board[1][5]}   |   #{game_board[2][5]}   |   #{game_board[3][5]}   |   #{game_board[4][5]}   |   #{game_board[5][5]}   |   #{game_board[6][5]}   |
        ----------------------------------------------------------
        |   #{game_board[0][4]}   |   #{game_board[1][4]}   |   #{game_board[2][4]}   |   #{game_board[3][4]}   |   #{game_board[4][4]}   |   #{game_board[5][4]}   |   #{game_board[6][4]}   |
        ----------------------------------------------------------
        |   #{game_board[0][3]}   |   #{game_board[1][3]}   |   #{game_board[2][3]}   |   #{game_board[3][3]}   |   #{game_board[4][3]}   |   #{game_board[5][3]}   |   #{game_board[6][3]}   |
        ----------------------------------------------------------
        |   #{game_board[0][2]}   |   #{game_board[1][2]}   |   #{game_board[2][2]}   |   #{game_board[3][2]}   |   #{game_board[4][2]}   |   #{game_board[5][2]}   |   #{game_board[6][2]}   |
        ----------------------------------------------------------
        |   #{game_board[0][1]}   |   #{game_board[1][1]}   |   #{game_board[2][1]}   |   #{game_board[3][1]}   |   #{game_board[4][1]}   |   #{game_board[5][1]}   |   #{game_board[6][1]}   |
        ----------------------------------------------------------
        |   #{game_board[0][0]}   |   #{game_board[1][0]}   |   #{game_board[2][0]}   |   #{game_board[3][0]}   |   #{game_board[4][0]}   |   #{game_board[5][0]}   |   #{game_board[6][0]}   |
        ----------------------------------------------------------


board