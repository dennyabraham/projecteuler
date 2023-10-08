require_relative 'problem'

RSpec.describe Problem, :aggregate_failures do
  it 'answers' do
    puts "answer: #{subject.triplet_with_sum(1000)}"
  end
end
