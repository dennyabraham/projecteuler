require_relative '../0007/problem_seven'

module Problem12
  class << self
    def divisors(number)
      (1..(number / 2)).select do |factor|
        (number % factor).zero?
      end + [number]
    end

    def triangle_number_with_at_least_n_divisors(min)
      max = 0
      ProblemSeven.natural_numbers_list.reduce(0) do |sum, number|
        d = divisors(sum)
        return sum if d.size > min
        if d.size > max
          max = d.size
          puts "#{number}, #{d.size}"
        end

        sum + number
      end
    end
  end
end
