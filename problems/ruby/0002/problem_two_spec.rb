# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/problem_two"

describe ProblemTwo do
  it 'should calculate the terms of the fibonacci sequence below 10' do
    Fibonacci.terms_below(10).should == [1, 2, 3, 5, 8]
  end

  it 'should calculate the terms of the fibonacci sequence below 15' do
    Fibonacci.terms_below(15).should == [1, 2, 3, 5, 8, 13]
  end

  it 'should find the terms of the fibonacci sequence below 4000000' do
    p Fibonacci.terms_below(4_000_000)
  end

  it 'should find the even terms of the fibonacci sequence below 10' do
    Fibonacci.even_terms_below(10).should == [2, 8]
  end

  it 'should find the sum of even terms below 10' do
    Fibonacci.sum_of_even_terms_below(10).should == 10
  end

  it 'should find the sum of even terms below 15' do
    Fibonacci.sum_of_even_terms_below(15).should == 10
  end

  it 'should find the sum of the terms below 4000000' do
    p Fibonacci.sum_of_even_terms_below(4_000_000)
  end
end
