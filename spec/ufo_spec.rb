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
end