require_relative "problem_seven"

RSpec.describe ProblemSeven do
  describe '.prime?' do
    it 'identifies primes' do
      expect(ProblemSeven).to be_prime(2)
      expect(ProblemSeven).to be_prime(7)
      expect(ProblemSeven).to be_prime(677)
      expect(ProblemSeven).to be_prime(2791)
    end

    it 'identifies composites' do
      expect(ProblemSeven).not_to be_prime(4)
      expect(ProblemSeven).not_to be_prime(3000)
      expect(ProblemSeven).not_to be_prime(7047)
      expect(ProblemSeven).not_to be_prime(11_441)
    end
  end

  describe '.nth_prime' do
    it 'nth prime' do
      expect(ProblemSeven.nth_prime(6)).to eq(13)
    end
  end

  describe 'answer' do
    it 'answers' do
      puts "answer: #{ProblemSeven.nth_prime(10_001)}"
    end
  end
end
