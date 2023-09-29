# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/problem_one"

describe ProblemOne do
  it 'should find all multiples of 3 below 10' do
    3.multiples_below(10).should == [3, 6, 9]
  end

  it 'should find all multiples of 5 below 10' do
    5.multiples_below(10).should == [5]
  end

  it 'should find all multiples of 3 or 5 below 10' do
    [3, 5].multiples_below(10).sort.should == [3, 5, 6, 9]
  end

  it 'should find all the multiples of 3 or 5 below 20' do
    [3, 5].multiples_below(20).sort.should == [3, 5, 6, 9, 10, 12, 15, 18]
  end

  it 'should find the sum of all multiples of 3 or 5 below 10' do
    [3, 5].sum_of_multiples_below(10).should == 23
  end

  it 'should find the sum of all multiples of 3 or 5 below 1000' do
    p [3, 5].sum_of_multiples_below(1000)
  end
end
