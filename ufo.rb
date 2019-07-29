
def ufo_game
  @x = ["                 .
                   |
                .-\"^\"-.
               /_....._\\
           .-\"`         `\"-.
          (  ooo  ooo  ooo  )
           '-.,_________,.-'
                /     \\
               /       \\
              /    O    \\
             /   --|--   \\
            /      |      \\
           /      / \\      \\
  ",
  "                 .
                   |
                .-\"^\"-.
               /_....._\\
           .-\"`         `\"-.
          (  ooo  ooo  ooo  )
           '-.,_________,.-'
                /     \\
               /   O   \\
              /  --|--  \\
             /     |     \\
            /     / \\     \\
           /               \\
  ",
  "                 .
                   |
                .-\"^\"-.
               /_....._\\
           .-\"`         `\"-.
          (  ooo  ooo  ooo  )
           '-.,_________,.-'
                /  O  \\
               / --|-- \\
              /    |    \\
             /    / \\    \\
            /             \\
           /               \\
  ",
  "                 .
                   |
                .-\"^\"-.
               /_....._\\
           .-\"`         `\"-.
          (  ooo  ooo  ooo  )
           '-.,_________,.-'
                /--|--\\
               /   |   \\
              /   / \\   \\
             /           \\
            /             \\
           /               \\
  ",
  "                 .
                   |
                .-\"^\"-.
               /_....._\\
           .-\"`         `\"-.
          (  ooo  ooo  ooo  )
           '-.,_________,.-'
                /  |  \\
               /  / \\  \\
              /         \\
             /           \\
            /             \\
           /               \\
  ",
  "
                   .
                   |
                .-\"^\"-.
               /_....._\\
           .-\"`         `\"-.
          (  ooo  ooo  ooo  )
           '-.,_________,.-'
                / / \\ \\
               /       \\
              /         \\
             /           \\
            /             \\
           /               \\
  ",
  "
                   .
                   |
                .-\"^\"-.
               /_....._\\
           .-\"`         `\"-.
          (  ooo  ooo  ooo  )
           '-.,_________,.-'
                /     \\
               /       \\
              /         \\
             /           \\
            /             \\
           /               \\
  "]
  
  @dictionary = File.readlines("dictionary.txt").sample.delete_suffix("\n")
  puts @dictionary
  
  puts "UFO: The Game"
  puts "Instructions: save us from alien abduction by guessing letters in the codeword."
  puts @x[0]
  puts "Incorrect Guesses: None"
  
  @codeword = ""
  @dictionary.length.times do
    @codeword += "_"
  end
  
  @codeword_with_spaces = @codeword.scan(/.{1}/).join(' ')
  
  p @dictionary
  # p @codeword_with_spaces
    
  
  
  @incorrect = []
  @correct = []
  
  @iterator = 0
  
  
  # p @codeword
  # p @codeword_with_spaces


  while (@codeword.downcase() != @dictionary && @iterator < 6)
    puts "Codeword: #{@codeword_with_spaces}"
    puts "Please enter your guess:"

    guess = gets.chomp.downcase()

    if (guess =~ /\b[[:alpha:]]\b/) == nil
      puts "I cannot understand your input. Please guess a single letter." 
    elsif @codeword_with_spaces.include?(guess.upcase()) == true
      puts "You can only guess that letter once, please try again."
    elsif @dictionary.include?(guess) == true
      indexes = []
      i = 0
      while @dictionary.length > i
        if @dictionary[i] == guess
          indexes << i
        end
        i += 1
      end
      # p indexes
      indexes.each do |index|
        # p index
        # p guess
        @codeword[index] = guess.upcase()
        @codeword_with_spaces = @codeword.scan(/.{1}/).join(' ')
        puts @codeword_with_spaces
        # p @codeword.downcase()
        # p @dictionary
      end 
      if @codeword.downcase() == @dictionary
        puts "Correct! You saved the person and earned a medal of honor!"
        puts "The codeword is: #{@dictionary.upcase()}"
      else
        puts "Correct! You're closer to cracking the codeword."
        puts @x[@iterator]
      end
    else  
      @incorrect << guess.upcase()
      @iterator += 1
      if @iterator != 6
        puts "Incorrect! The tractor beam pulls the person in further."
       else
         puts "Sorry you have been captured!"
         puts "The codeword was #{@dictionary.upcase()}"
      end
      puts @x[@iterator]
      puts "Incorrect guesses: #{@incorrect*" "}"
    # puts @incorrect
    end
  # p @iteratorend
  end
end

ufo_game()

puts "Would you like to play again (Y/N)?"
response = gets.chomp
if response.upcase == "Y"
  ufo_game
elsif response.upcase == "N"
  puts "Goodbye!"
else
  puts "Sorry, I cannot understand your input. Please enter Y or N"
end