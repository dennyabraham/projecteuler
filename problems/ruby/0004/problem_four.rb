# frozen_string_literal: true

module ProblemFour
  def self.palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def three_digit_sums
    Enumerator::Lazy.new do
      (999...100).each do |jdx|
        (999...100).each do |idx|
          yield idx * jdx
        end
      end
    end
  end

  def find
    three_digit_sums.reduce(1) do |max, n|
      if n < max
        n
      else if palindrome?(n)
        max
      else
        n
      end
    end
  end
end



