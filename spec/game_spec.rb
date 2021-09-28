require_relative '../lib/game'

describe Game do
   
    describe '#play_game' do
        context 'The gameover condition has been reached' do 
            subject(:play_game_true_test) {described_class.new('Jack', 'Jill')}
            before do
                valid_input = '4'
                allow(play_game_true_test).to receive(:check_win).and_return(true) 
                allow(play_game_true_test).to receive(:player_choose).and_return(valid_input)
                allow(play_game_true_test).to receive(:update_board).with(4)   
            end
            it 'sends a message to switch player' do
                expect(play_game_true_test).to receive(:switch_player).once
                play_game_true_test.play_game
            end
    
            it 'sends a message to player choose' do 
                expect(play_game_true_test).to receive(:player_choose).once
                play_game_true_test.play_game
            end

            it 'sends a message to update_board' do 
                expect(play_game_true_test).to receive(:update_board).with(4).once
                play_game_true_test.play_game
            end
    
            it 'sends a message to update display' do 
                display = play_game_true_test.instance_variable_get(:@display)
                expect(display).to receive(:update_display).once
                play_game_true_test.play_game
                
            
            end
            it 'sends check_win once' do
                expect(play_game_true_test).to receive(:check_win).once
                play_game_true_test.play_game
            end
        end

        context 'The gameover condition is reached after the second player goes' do
            subject(:play_game_false_test) {described_class.new('John', 'Jill')}
            before do
                valid_input = '4'
                allow(play_game_false_test).to receive(:check_win).twice.and_return(false,true)     
                allow(play_game_false_test).to receive(:player_choose).and_return(valid_input) 
                allow(play_game_false_test).to receive(:update_board).with(4)         
            end
            it 'sends a message to switch player 2 times' do
                expect(play_game_false_test).to receive(:switch_player).twice
                play_game_false_test.play_game
            end
    
            it 'sends a message to player choose 2 times' do 
                expect(play_game_false_test).to receive(:player_choose).twice
                play_game_false_test.play_game
            end
    
            it 'sends a message to update display 2 times' do 
                
                display = play_game_false_test.instance_variable_get(:@display)
                expect(display).to receive(:update_display).twice
                play_game_false_test.play_game
                
            
            end
            it 'sends check_win and returns true 2 times' do
                expect(play_game_false_test).to receive(:check_win).twice
                play_game_false_test.play_game
            end
        end
    end

    describe '#player_choose' do
        
        context 'the player makes a valid choice the first time' do 
            subject(:player_choose_once_test) {described_class.new('Jerry', 'Jacky')}

            before do
                allow(player_choose_once_test).to receive(:take_column_choice).and_return("7")
                allow(player_choose_once_test).to receive(:verify_column).with('7').and_return(true)
            end

            it 'takes player column choice once' do
                expect(player_choose_once_test).to receive(:take_column_choice).once
                player_choose_once_test.player_choose
            end

            it 'verifies player choice once' do
                expect(player_choose_once_test).to receive(:verify_column).once
                player_choose_once_test.player_choose
            end
        end

        context 'the player makes an invalid choice, then a valid choice' do

            subject(:player_choose_twice_test) {described_class.new('Joe', 'Jill')}

            before do
                valid_input = 'b'
                invalid_input = '6'
                allow(player_choose_twice_test).to receive(:take_column_choice).and_return(invalid_input, valid_input)
                allow(player_choose_twice_test).to receive(:verify_column).with(invalid_input).and_return(false)
                allow(player_choose_twice_test).to receive(:verify_column).with(valid_input).and_return(true)
            end

            it 'takes player column choice twice' do 
                expect(player_choose_twice_test).to receive(:take_column_choice).twice
                player_choose_twice_test.player_choose
            end

            it 'takes player verify choice twice' do
                expect(player_choose_twice_test).to receive(:verify_column).twice
                player_choose_twice_test.player_choose
            end
        end
    end

    describe '#switch_player' do
    
        context 'when the current player is R' do
            subject(:switch_to_blue_test) {described_class.new('Alex', 'Rudy')}

            

            it 'it switches to B' do
                switch_to_blue_test.instance_variable_set(:@symbol,'R')
                switch_to_blue_test.switch_player
                player = switch_to_blue_test.instance_variable_get(:@symbol)
                expect(player).to eq('B')
            end

            it 'it sends a message to the display instance to switch players' do
                switch_to_blue_test.instance_variable_set(:@symbol,'R')
                display = switch_to_blue_test.instance_variable_get(:@display)
                new_symbol = 'B'
                expect(display).to receive(:switch_symbol).with(new_symbol).once
                switch_to_blue_test.switch_player
            end
        
        end

        context 'when the current player is B' do
            subject(:switch_to_red_test) {described_class.new('Alex', 'Rudy')}
            it 'switches to R' do
                switch_to_red_test.switch_player
                player = switch_to_red_test.instance_variable_get(:@symbol)
                expect(player).to eq('R')
            end

            it 'it sends a message to the display instance to switch players' do
                display = switch_to_red_test.instance_variable_get(:@display)
                new_symbol = 'R'
                expect(display).to receive(:switch_symbol).with(new_symbol).once
                switch_to_red_test.switch_player
            end
        end
    end

    describe '#update_board' do
        subject(:update_board_test) {described_class.new('Jack','Jill')}

        it 'adds to a completely empty board' do
            current_board = Array.new(7) {Array.new(6, '-')}
            update_board_test.instance_variable_set(:@game_board, current_board)
            column_choice = 4
            update_board_test.update_board(column_choice)
            result = current_board[3][0]
            expect(result).to eq('B')
        end

        it 'adds to a nearly full board' do
            current_board = Array.new(6) {Array.new(6, '-')}
            current_board.append(['B', 'B', 'B', 'B', 'B', 'B', '-'])
            update_board_test.instance_variable_set(:@game_board, current_board)
            column_choice = 7
            update_board_test.update_board(column_choice)
            result = current_board[6][6]
            expect(result).to eq('B')
        end
    end

    describe '#verify_column' do
         context 'when the input is valid' do
            subject(:verify_column_valid_test) {described_class.new('Jack', 'Johnny')}
            context 'and the column is full' do 
                it 'it returns false' do 
                    game_board = Array.new(6, Array.new(7, nil))
                    game_board[0] = ['B', 'B', 'B', 'B', 'B', 'B']
                    verify_column_valid_test.instance_variable_set(:@game_board, game_board)
                    column_choice = '1'
                    result = verify_column_valid_test.verify_column(column_choice)
                    expect(result).to eq(false)
                end
            end

            context 'and the column has room in it' do 
                it 'it returns true' do
                    game_board = Array.new(7, Array.new(6, nil))
                    game_board[1] = ['B', 'B', 'B', 'B', 'B', nil]
                    verify_column_valid_test.instance_variable_set(:@game_board, game_board)
                    column_choice = '2'
                    result = verify_column_valid_test.verify_column(column_choice)
                    expect(result).to eq(true)
                end
            end
         end
         context 'when the input is invalid' do 
            subject(:verify_column_invalid_test) {described_class.new('Jill', 'Jerry')}
            it 'it returns false for letters' do
                invalid_input = 'F'
                result = verify_column_invalid_test.verify_column(invalid_input)
                expect(result).to eq(false)
            end

            it 'it returns false for inputs of more than 1 character' do 
                invalid_input = '23'
                result = verify_column_invalid_test.verify_column(invalid_input)
                expect(result).to eq(false)
            end
         end
    end

    describe '#check_win' do 
        context 'when a player wins' do 
            subject(:check_win_won_test) {described_class.new('Bob', 'Rob')}
            it "it causes someone to win with a vertical sequence" do 
                game_board = Array.new(7) {Array.new(6, '-')}
                game_board[1][0] = 'B'
                game_board[1][1] = 'B'
                game_board[1][2] = 'B'
                game_board[1][3] = 'B'
                check_win_won_test.instance_variable_set(:@game_board, game_board)
                check_win_won_test.check_win
                game_over = check_win_won_test.instance_variable_get(:@game_over)
                expect(game_over).to eq(true)
            end

            it "it causes someone to win with a horizontal sequence" do 
                game_board = Array.new(7) {Array.new(6, '-')}
                game_board[1][1] = 'B'
                game_board[2][1] = 'B'
                game_board[3][1] = 'B'
                game_board[4][1] = 'B'
                check_win_won_test.instance_variable_set(:@game_board, game_board)
                check_win_won_test.check_win
                game_over = check_win_won_test.instance_variable_get(:@game_over)
                expect(game_over).to eq(true)
            end

            it "it causes someone to win with a upward sequence" do 
                game_board = Array.new(7) {Array.new(6, '-')}
                game_board[1][1] = 'B'
                game_board[2][2] = 'B'
                game_board[3][3] = 'B'
                game_board[4][4] = 'B'
                check_win_won_test.instance_variable_set(:@game_board, game_board)
                check_win_won_test.check_win
                game_over = check_win_won_test.instance_variable_get(:@game_over)
                expect(game_over).to eq(true)
            end

            it "it causes someone to win with a downward sequence" do 
                game_board = Array.new(7) {Array.new(6, '-')}
                game_board[1][4] = 'B'
                game_board[2][3] = 'B'
                game_board[3][2] = 'B'
                game_board[4][1] = 'B'
                check_win_won_test.instance_variable_set(:@game_board, game_board)
                check_win_won_test.check_win
                game_over = check_win_won_test.instance_variable_get(:@game_over)
                expect(game_over).to eq(true)
            end
        end

        context "when a player doesn't win" do
            subject(:check_win_lost_test) {described_class.new('Bobby', 'Ricky')}
            it "it ends the game when the board is full" do 
                game_board = Array.new(7) {Array.new(6, 'green')}
                check_win_lost_test.instance_variable_set(:@game_board, game_board)
                check_win_lost_test.check_win
                game_over = check_win_lost_test.instance_variable_get(:@game_over)
                expect(game_over).to eq(true)
            end

            it "it continues the game when there is no sequence and the board isn't full" do 
                game_board = Array.new(7) {Array.new(6, '-')}
                check_win_lost_test.instance_variable_set(:@game_board, game_board)
                check_win_lost_test.check_win
                game_over = check_win_lost_test.instance_variable_get(:@game_over)
                expect(game_over).to eq(false)
            end
            
        end
    end
end