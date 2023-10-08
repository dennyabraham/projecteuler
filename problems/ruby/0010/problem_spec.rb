require_relative 'problem'

RSpec.describe Problem10, :aggregate_failures do
  it 'sums up to 10' do
    expect(subject.sum_of_primes_up_to(10)).to eq(17)
  end

  it 'answers' do
    puts "answer: #{subject.sum_of_primes_up_to(2_000_000)}"
  end
end
