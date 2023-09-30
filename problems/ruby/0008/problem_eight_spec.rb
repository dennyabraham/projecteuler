require_relative 'problem_eight'

RSpec.describe ProblemEight, :aggregate_failures do
  it 'answers' do
    puts "answer #{ProblemEight.greatest_substring(13).reduce(&:*)}"
  end
end
