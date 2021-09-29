require_relative '../lib/display'

describe GameDisplay do 
    describe '#switch_symbol' do
        context 'When the new symbol given is B' do 
            subject(:switch_to_B_test) {described_class.new('board', 'Jo', 'Bob')}
           it 'it makes the instance variable for the current symbol B' do
                switch_to_B_test.instance_variable_set(:@current_symbol, 'R')
                new_symbol = 'B'
                switch_to_B_test.switch_symbol(new_symbol)
                symbol = switch_to_B_test.instance_variable_get(:@current_symbol)
                expect(symbol).to eq('B')
           end 

           it 'it makes the current player instance variable change to player two' do 
            new_symbol = 'B'
            switch_to_B_test.switch_symbol(new_symbol)
            current_player = switch_to_B_test.instance_variable_get(:@current_player)
            expect(current_player).to eq('Bob')
           end
        end

        context 'When the new symbol given is R' do 
            
            subject(:switch_to_R_test) {described_class.new('board', 'Jo', 'Bob')}
           it 'it makes the instance variable for the current symbol R' do
                switch_to_R_test.instance_variable_set(:@current_symbol, 'B')
                new_symbol = 'R'
                switch_to_R_test.switch_symbol(new_symbol)
                symbol = switch_to_R_test.instance_variable_get(:@current_symbol)
                expect(symbol).to eq('R')
           end 

           it 'it makes the current player instance variable change to player one' do 
            new_symbol = 'R'
            switch_to_R_test.switch_symbol(new_symbol)
            current_player = switch_to_R_test.instance_variable_get(:@current_player)
            expect(current_player).to eq('Jo')
           end
         end
    end

end
