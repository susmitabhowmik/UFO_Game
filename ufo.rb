class UFO
  def dictionary
    return File.readlines("dictionary.txt").sample.delete_suffix("\n")
  end

  def codeword(word)
    codeword = ""
    word.length.times do
      codeword += "_"
    end
    return codeword
  end

  def codeword_with_spaces(codeword)
    return codeword.scan(/.{1}/).join(' ')
  end

  def game 
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
  
    @dictionary = UFO.new.dictionary
    puts @dictionary
    puts "UFO: The Game"
    puts "Instructions: save us from alien abduction by guessing letters in the   codeword."  
    puts @x[0]  
    puts "Incorrect Guesses: None"
    
    @codeword = UFO.new.codeword(@dictionary)
    
    @codeword_with_spaces = UFO.new.codeword_with_spaces(@codeword)
    
    @incorrect = []
    @correct = []
    
    @iterator = 0
  
    while (@codeword.downcase != @dictionary && @iterator < 6)
      puts "Codeword: #{@codeword_with_spaces}"
      puts "Please enter your guess:"
  
      guess = gets.chomp.downcase
  
      if (guess =~ /\b[[:alpha:]]\b/) == nil
        puts "I cannot understand your input. Please guess a single letter." 
       elsif (@codeword_with_spaces.include?(guess.upcase) == true || @incorrect.   include?(guess.upcase) == true)  
         puts "You can only guess that l  etter once, please try again."   
       elsif @dictionary.include?(guess) == true  
         indexes = []
         i = 0
         while @dictionary.length > i
           if @dictionary[i] == guess
             indexes << i
           end
           i += 1
         end
         indexes.each do |index|
           @codeword[index] = guess.upcase
           @codeword_with_spaces = @codeword.scan(/.{1}/).join(' ')
           puts @codeword_with_spaces
         end 
         if @codeword.downcase == @dictionary
           puts "Correct! You saved the person and earned a medal of honor!"
           puts "The codeword is: #{@dictionary.upcase}"
           UFO.new.replay
         else
           puts "Correct! You're closer to cracking the codeword."
           puts @x[@iterator]
           puts "Incorrect guesses: #{@incorrect*" "}"
         end
      else  
        @incorrect << guess.upcase
        @iterator += 1
        if @iterator != 6
          puts "Incorrect! The tractor beam pulls the person in further."
         else
           puts "Sorry you have been captured!"
           puts "The codeword was #{@dictionary.upcase}"
           UFO.new.replay
        end
        puts @x[@iterator]
        puts "Incorrect guesses: #{@incorrect*" "}"
      end
    end
  end

  def replay
    puts "Would you like to play again (Y/N)?"
    response = gets.chomp
    if response.upcase == "Y"
      UFO.new.game
    elsif response.upcase == "N"
      puts "Goodbye!"
    else
      puts "Sorry, I cannot understand your input. Please enter Y or N"
    end
  end
end

#only run if script is run from the command line and not required by another file
if __FILE__ == $0
  UFO.new.game
end