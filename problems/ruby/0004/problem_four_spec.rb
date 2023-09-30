# frozen_string_literal: true

require_relative 'problem_four'

RSpec.describe ProblemFour, :aggregate_failures do
  describe '.palindrome?' do
    it 'knows a palindrome' do
      expect(ProblemFour).to be_a_palindrome(1)
      expect(ProblemFour).to be_a_palindrome(121)
      expect(ProblemFour).to be_a_palindrome(1221)
      expect(ProblemFour).to be_a_palindrome(420024)
    end

    it "knows a non palindrome" do
      expect(ProblemFour).not_to be_a_palindrome(13)
      expect(ProblemFour).not_to be_a_palindrome(123)
      expect(ProblemFour).not_to be_a_palindrome(1231)
      expect(ProblemFour).not_to be_a_palindrome(420069)
    end
  end

  describe '.three_digit_sums' do
    it "returns a bunch of numbers" do
      expect(ProblemFour.three_digit_sums.max).to eq(998_001)
      expect(ProblemFour.three_digit_sums.min).to eq(10_000)
      expect(ProblemFour.three_digit_sums.count).to eq(810_000)
    end
  end

  describe 'the answer' do
    it "is an answer" do
      puts "max is #{ProblemFour.find_max_palindrome}"
    end
  end
end
