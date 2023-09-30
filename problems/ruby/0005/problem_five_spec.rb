require_relative 'problem_five'

RSpec.describe ProblemFive, :aggregate_failures do
  describe '.sum' do
    it 'finds the sum of a frequency table of factors' do
      expect(ProblemFive.sum(2 => 3, 5 => 1)).to eq(40)
      expect(ProblemFive.sum(1 => 3, 3 => 2, 5 => 1)).to eq(45)
      expect(ProblemFive.sum(3 => 3, 7 => 1)).to eq(189)
    end
  end

  describe '.factors' do
    it 'finds the factors of a number' do
      expect(ProblemFive.factors(13)).to eq(13 => 1)
      expect(ProblemFive.factors(15)).to eq(3 => 1, 5 => 1)
      expect(ProblemFive.factors(16)).to eq(2 => 4)
      expect(ProblemFive.factors(48)).to eq(2 => 4, 3 => 1)
    end
  end

  describe '.merge' do
    it 'chooses the max of the values in a hash' do
      expect(ProblemFive.merge({1 => 3, 2 => 1}, {1 => 1, 3 => 8})).to eq({1 => 3, 2 => 1, 3 => 8})
      expect(ProblemFive.merge({2 => 3, 5 => 1}, {2 => 2, 5 => 2})).to eq({2 => 3, 5 => 2})
      expect(ProblemFive.sum(ProblemFive.merge({2 => 3, 5 => 1}, {2 => 2, 5 => 2}))).to eq(200)
    end
  end

  describe 'answer' do
    it 'answers' do
      puts "answer: #{ProblemFive.sum(ProblemFive.merge(*(1..20).map { |factor| ProblemFive.factors(factor) }))}"
    end
  end
end
