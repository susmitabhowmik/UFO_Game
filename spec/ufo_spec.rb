require './ufo'

RSpec.describe UFO do
  describe '#dictionary' do
    it 'should return a word contained within the dictionary' do
      result = File.readlines("dictionary.txt").grep(/#{UFO.new.dictionary}/).any?
      expect(result).to eq(true)
    end
  end

  describe '#codeword' do
    it 'should return a series of underscores equal in number to the length of the input string' do
      result = UFO.new.codeword("this")
      expect(result).to eq("____")
    end
  end

  describe "#codeword_with_spaces" do
    it 'should add spaces between each letter in the input string' do
      result = UFO.new.codeword_with_spaces("hello")
      expect(result).to eq("h e l l o")
    end
  end

  describe "#single_letter" do
    it 'should return true if given a single letter' do
      result = UFO.new.single_letter("a")
      expect(result).to eq(true)
    end
  end

  describe "#single_letter" do
    it 'should return true if given a single letter' do
      result = UFO.new.single_letter("C")
      expect(result).to eq(true)
    end
  end

  describe "#single_letter" do
    it 'should return false if given a number' do
      result = UFO.new.single_letter("7")
      expect(result).to eq(false)
    end
  end

  describe "#single_letter" do
    it 'should return false if given a string of characters' do
      result = UFO.new.single_letter("hello world!")
      expect(result).to eq(false)
    end
  end

  describe "#index_array" do
    it 'should return an array of the indexes at which a given letter is contained within a given string' do
      result = UFO.new.index_array("missippi","i")
      expect(result).to eq([1,4,7])
    end
  end

  describe "#string_to_hash" do
    it 'should take in a string and return a hash with all the letters as the keys and the respective indexes of the letters as the values' do
      hash1 = UFO.new.string_to_hash("b_k_")
      result = hash1.to_a
      expect(result).to eq([["b",0],["k",2]])
    end
  end

  describe "#find_words" do
    it 'should return the number of words that match the codeword in the dictionary during a certain point in the game' do
      result = UFO.new.find_words("z____r",["Y"])
      expect(result).to eq(2)
    end
  end
end