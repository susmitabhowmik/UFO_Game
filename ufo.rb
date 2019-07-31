class UFO
  def dictionary
    return File.readlines("dictionary.txt").sample.chomp
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

  def single_letter(input)
    if (input =~ /\b[[:alpha:]]\b/) == nil
      return false
    else 
      return true
    end
  end

  def index_array(word,letter)
    indexes = []
    i = 0
    while word.length > i
      if word[i] == letter
        indexes << i
      end
      i += 1
    end
    return indexes
  end

  def game 
    x = ["                 .
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

  
    dictionary = UFO.new.dictionary
    puts "UFO: The Game"
    puts "Instructions: save us from alien abduction by guessing letters in the codeword."  
    puts x[0]  
    puts "Incorrect Guesses: None"
    
    codeword = UFO.new.codeword(dictionary)
    codeword_with_spaces = UFO.new.codeword_with_spaces(codeword)
    incorrect = []    
    iterator = 0
    

    while (codeword.downcase != dictionary && iterator < 6)
      puts "Codeword: #{codeword_with_spaces}"
      puts "Please enter your guess:"

      guess = gets.chomp.downcase
  
      if (UFO.new.single_letter(guess) == false)
        puts "I cannot understand your input. Please guess a single letter." 
       elsif (codeword_with_spaces.include?(guess.upcase) == true || incorrect.include?(guess.upcase) == true)  
         puts "You can only guess that letter once, please try again."   
       elsif dictionary.include?(guess) == true  
         indexes = UFO.new.index_array(dictionary,guess)
         indexes.each do |index|
           codeword[index] = guess.upcase
           codeword_with_spaces = UFO.new.codeword_with_spaces(codeword)
         end 
         if codeword.downcase == dictionary
           puts "Correct! You saved the person and earned a medal of honor!"
           puts "The codeword is: #{dictionary.upcase}."
           UFO.new.replay
         else
           puts "Correct! You're closer to cracking the codeword."
           puts x[iterator]
           puts "Incorrect guesses: #{incorrect*" "}"
           puts "Number of dictionary matches: #{UFO.new.find_words(codeword.downcase,incorrect)}"
         end
      else  
        incorrect << guess.upcase
        iterator += 1
        if iterator != 6
          puts "Incorrect! The tractor beam pulls the person in further."
         else
           puts "Sorry you have been captured!"
           puts x[iterator]
           puts "The codeword was #{dictionary.upcase}."
           return UFO.new.replay
        end
        puts x[iterator]
        puts "Incorrect guesses: #{incorrect*" "}"
        puts "Number of dictionary matches: #{UFO.new.find_words(codeword.downcase,incorrect)}"
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

  def string_to_hash(str)
    hash = {}.compare_by_identity
    array = str.split('')
    i = 0
    array.each do |element|
      if (UFO.new.single_letter(element) == true)
        hash[element] = i
      end
      i += 1
    end
    return hash
  end

  def find_words (codeword, incorrect_array)
    codeword_array = UFO.new.string_to_hash(codeword).to_a
    array = []
    File.readlines("dictionary.txt").each do |line|
      word = line.chomp
      if word.length == codeword.length
        if incorrect_array.any? {|i| word.include? i.downcase} == false
          word_array = UFO.new.string_to_hash(word).to_a
          if ((codeword_array - word_array).empty? == true && array.include?(word) == false)
            array << word
          end
        end
      end
    end
    return array.length
  end
end


# only run if script is run from the command line 
if __FILE__ == $0
  UFO.new.game
end