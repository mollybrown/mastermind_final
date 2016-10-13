class Instructions

	def display_instructions
		puts
		puts "***************************************************************************"
		puts "                          MASTERMIND INSTRUCTIONS"
		puts "***************************************************************************"
		puts 
		puts "                      Welcome to Mastermind, The Game"
		puts 
		puts "                      MISSION: BREAK THE SECRET CODE"
		puts
		puts "The secret code is made up of four elements: Red, Green, Blue, and Yellow."
		puts
		puts "The four elements can appear in any order, up to four times. You have an"
		puts "unlimited number of guesses. Each time you make a guess without cracking"
		puts "code, you will recieve two hints."
		puts
		puts "One hint will give you the number of correct color elements in your guess."
		puts
		puts "Another hint will give you the number of correctly positioned/ordered"
		puts "color elements in your guess."
		puts
		puts "For example, if you guess 'RRGY' and the secret code is 'RRRR',"
		puts "then you will recieve feedback telling you that you have one color correct,"
		puts "and two positions correct."
		puts
		puts "Exit the game at any time by typing 'q' or 'quit'."
		puts
		puts "Be a cheater and reveal the secret code by typing 'c' or 'cheat'." 
		puts
		puts "                              GOOD LUCK!"                    
		puts
		puts "*************************************************************************"
		puts

	end		
end