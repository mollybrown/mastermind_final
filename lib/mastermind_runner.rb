require './lib/mastermind_game.rb'
require './lib/mastermind_instructions.rb'

class MastermindRunner 

	def initialize
		@response = nil
	end

	def display_startup_menu(response)
		puts
		puts		" _____  _____  _____  _____  _____  _____  _____  _____  _____  ____  " 
		puts		"|     ||  _  ||   __||_   _||   __|| __  ||     ||     ||   | ||    \ "
		puts		"| | | ||     ||__   |  | |  |   __||    -|| | | ||-   -|| | | ||  |  |"
		puts		"|_|_|_||__|__||_____|  |_|  |_____||__|__||_|_|_||_____||_|___||____/ " 
		puts
		
		until response == "q" || response == "quit"
			puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
			print "> "

			response = gets.chomp.downcase

			if response == "i" || response == "instructions"
				Instructions.new.display_instructions
			elsif response == "p"	|| response == "play"
				start_game
			elsif response == "q" || response == "quit"
				exit	
			else
				puts "Please select a valid option..."
			end
		end
	end 

	def start_game
		Game.new.play_mastermind
	end

end


