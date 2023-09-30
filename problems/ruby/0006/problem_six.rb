module ProblemSix
  def self.answer
    sum_of_squares = 0
    sum = 0

    (1..100).each do |idx|
      sum_of_squares += idx**2
      sum += idx
    end

    (sum**2) - sum_of_squares
  end
end
