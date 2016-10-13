class Game

	def initialize
		@colors = ["r","g","b","y"]
		@secret_code = []
		@correct_colors = 0
    @correct_positions = 0
	end

	def generate_secret_code
		4.times do |color|
			@secret_code << @colors.sample
		end 
	end

	def game_timer(start, stop)
		time_elapsed = stop - start
    minutes = time_elapsed.to_i / 60
    seconds = time_elapsed.to_i % 60
    "#{minutes} minutes, #{seconds} seconds"
	end	

	def get_user_input
    print "> "
    gets.chomp.downcase
  end

	def play_mastermind
		@start_time = Time.now
		@guesses = 0
		game_over = false
		generate_secret_code

		puts "I have generated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow." 
		puts "What's your guess?"

		until game_over == true

			response = get_user_input
		
			display_cheat_code(response) if response == 'c' || response == 'cheat'
			exit_game	if response == 'q' || response == 'quit'	
				
			if valid_user_guess?(response) == true
				@guesses += 1
				
				if response == @secret_code.join
					game_over = true 
					game_win_display(response)
				else
					puts guess_feedback(response)
				end
			end
		end
	end

	def guess_position_checker(response)
		guess_array = response.scan /\w/
		guess_array.zip(@secret_code).map do |a, b| 
			@correct_positions += 1 if a == b
		end
	end

   def guess_color_checker(response)
		response.chars.each_index do |index|
      if response[index] == @secret_code[index]
      	@correct_colors += 1 
      end
 	  end
	 end

	def guess_feedback(response)
		guess_position_checker(response)
		guess_color_checker(response)
		puts "'#{response.upcase}' has #{@correct_colors} correct colors in #{@correct_positions} correct positions." 
		@correct_positions = 0
		@correct_colors = 0

		puts "You've taken #{@guesses} guess(es). Guess again..."
		#puts "SECRET CODE: #{@secret_code}"
	end

	def valid_user_guess?(response)
		if response.length < 4
			 puts "Too short. You must input exactly 4 letters. Please try again."
			 valid_guess = false
		elsif response.length > 4
		  puts "Too long. You must input exactly 4 letters. Please try again."
		  valid_guess = false
		else
			valid_guess = true
		end
	end

	def play_again_option(response)
		until response == 'p' || response == 'play' || response == 'q' || response == 'quit'	

			puts "Do you want to (p)lay again or (q)uit?"
			response = get_user_input

			if response == 'p' || response == 'play'	
		 		play_mastermind
		 	elsif response == 'q' || response == 'quit'	
				exit_game
			else
				puts "Invalid input. Please try again."
				puts response
			end
		end
	end		

	def exit_game
    puts "Goodbye and thank you for playing!"
    exit
  end

  def display_cheat_code(response)
  	puts "SECRET CODE: '#{@secret_code.join.upcase}' ya filthy cheater."
  	puts
  	@secret_code = []
  	play_again_option(response)
  end

	def game_win_display(response)
		@end_time = Time.now
    game_time = game_timer(@start_time, @end_time)
    puts "-----------------------------------------------------------------------------------------------------------------"
		puts "CONGRATULATIONS! You guessed the sequence '#{@secret_code.join.upcase}' in #{@guesses} guesses over #{game_time}."	
		puts "-----------------------------------------------------------------------------------------------------------------"
		puts
		@secret_code = []
		play_again_option(response)
	end

end

#fixed formatting
