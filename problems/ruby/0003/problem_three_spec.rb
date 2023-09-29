require File.dirname(__FILE__) + '/problem_three'

describe "problem_three" do
  
  # 1 has no prime factors
  it "should find the prime factors of 0" do 
    prime_factors(0).should == []
  end
  
  it "should find the prime factors of 1" do 
    prime_factors(1).should == []
  end
  
  it "should find the prime factors of 2" do 
    prime_factors(2).should == [2]
  end
  
  it "should find the prime factors of 3" do
    prime_factors(3).should == [3]
  end
  
  it "should find the prime factors of 4" do
    prime_factors(4).should == [2,2]
  end
  
  it "should find the prime factors of 5" do
    prime_factors(5).should == [5]
  end
  
  it "should find the prime factors of 6" do
    prime_factors(6).should == [2,3]
  end
  
  it "should find the prime factors of 8" do
    prime_factors(8).should == [2,2,2]
  end
  
  it "should find the prime factors of 13195" do
    prime_factors(13195).should == [5,7,13,29]
  end
  
  it "should find the prime factors of 600851475143" do
    p prime_factors(600851475143).max
  end
  
end