require_relative 'problem'

RSpec.describe Problem9, :aggregate_failures do
  it 'answers' do
    puts "answer: #{subject.product_of_triplet_with_sum(1000)}"
  end
end
