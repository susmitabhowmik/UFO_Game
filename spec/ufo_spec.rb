require './ufo'

RSpec.describe UFO do
  describe '#dictionary' do
    it 'should return a word contained in the dictionary' do
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
    it 'should return an array of the indexes at which the letter is contained within a given string' do
      result = UFO.new.index_array("missippi","i")
      expect(result).to eq([1,4,7])
    end
  end

end