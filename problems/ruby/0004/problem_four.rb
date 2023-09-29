# frozen_string_literal: true

module ProblemFour
  def self.palindrome?(number)
    number.to_s == number.to_s.reverse
  end

  def self.three_digit_sums
    Enumerator.new do |y|
      999.downto(100).each do |jdx|
        999.downto(100).each do |idx|
          y << idx * jdx
        end
      end
    end
  end

  def self.find_max_palindrome
    three_digit_sums.reduce(1) do |current, n|
      if n > current && palindrome?(n)
        n
      else
        current
      end
    end
  end
end

