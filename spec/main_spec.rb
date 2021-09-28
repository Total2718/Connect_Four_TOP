# frozen_string_literal: true

require_relative '../lib/main'

    describe '#continue_playing?' do
   
        context 'When the players would like to continue playing' do
            
            
            it 'returns false' do
                result = continue_playing?('1')
                expect(result).to be false
                
            end

        end

        context 'When the players would like to stop playing' do
        
            it 'returns true' do 
                result = continue_playing?('2')
                expect(result).to be true
            end
        end
    end
