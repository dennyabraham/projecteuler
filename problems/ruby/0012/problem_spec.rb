require_relative 'problem'

RSpec.describe Problem12, :aggregate_failures do
  it 'lists the divisor' do
    expect(subject.divisors(1)).to eq([1])
    expect(subject.divisors(3)).to eq([1, 3])
    expect(subject.divisors(6)).to eq([1, 2, 3, 6])
    expect(subject.divisors(10)).to eq([1, 2, 5, 10])
    expect(subject.divisors(15)).to eq([1, 3, 5, 15])
    expect(subject.divisors(21)).to eq([1, 3, 7, 21])
    expect(subject.divisors(28)).to eq([1, 2, 4, 7, 14, 28])
  end

  it "answers" do
    puts "answer: #{subject.triangle_number_with_at_least_n_divisors(500)}"
  end
end
