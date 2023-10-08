require_relative '../0007/problem_seven.rb'

module Problem10
  def self.sum_of_primes_up_to(max)
    ProblemSeven.primes(cache: true, sequential: true).reduce(0) do |sum, prime|
      return sum if prime > max

      sum + prime
    end
  end
end
