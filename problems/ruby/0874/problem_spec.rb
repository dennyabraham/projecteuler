# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/problem"

describe Problem, :aggregate_failures do
  it 'gets the tth prime' do
    expect(Problem.tth_prime(0)).to eq(2)
    expect(Problem.tth_prime(1)).to eq(3)
    expect(Problem.tth_prime(2)).to eq(5)
  end

  it "calculates the prime score" do
    expect(Problem.prime_score([0, 0, 0, 0, 0])).to eq(10)
    expect(Problem.prime_score([1, 0, 0, 0, 1])).to eq(12)
    expect(Problem.prime_score([0, 1, 0, 0, 1])).to eq(12)
    expect(Problem.prime_score([1, 1, 1, 1, 1])).to eq(15)
    expect(Problem.prime_score([0, 0, 1, 1, 1])).to eq(13)
  end

  it "generates_lists of combinations" do
    expect(Problem.candidate_lists(2,5)).to contain_exactly(
      [0, 0, 0, 0, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 1],
      [0, 0, 1, 1, 1],
      [0, 1, 1, 1, 1],
      [1, 1, 1, 1, 1],
    )

    # https://www.baeldung.com/cs/generate-k-combinations
  end
end
