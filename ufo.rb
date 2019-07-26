
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

p @dictionary
# p @codeword_with_spaces
  


@incorrect = []

@iterator = 0


p @codeword
p @codeword_with_spaces

while (@codeword.downcase() != @dictionary && @iterator <= 6)
  puts "Codeword: #{@codeword_with_spaces}"
  puts "Please enter your guess:"

  guess = gets.chomp.downcase()
  if @dictionary.include?(guess) == true
    indexes = []
    i = 0
    while @dictionary.length > i
      if @dictionary[i] == guess
        indexes << i
      end
      i += 1
    end
    p indexes
    indexes.each do |index|
      # p index
      # p guess
      @codeword[index] = guess.upcase()
      @codeword_with_spaces = @codeword.scan(/.{1}/).join(' ')
      p @codeword_with_spaces
      p @codeword.downcase()
      p @dictionary
    end 
    puts "Correct! You're closer to cracking the codeword."
    puts @x[@iterator]
  else  
    @incorrect << guess.upcase()
    @iterator += 1
    if @iterator != 6
      puts "Incorrect! The tractor beam pulls the person in further."
    else
      puts "Sorry you have been captured!"
    end
    # puts @x[@iterator]
    # puts @incorrect
  end
  p @iterator
end