# frozen_string_literal: true

require_relative 'problem_four'

RSpec.describe ProblemFour do
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
end
