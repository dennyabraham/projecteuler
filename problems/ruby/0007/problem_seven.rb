module ProblemSeven
  PRIMES = [2, 3, 5, 7]

  def self.nth_prime(n)
    primes(cache: true).first(n).last
  end

  def self.primes(cache: false)
    natural_numbers { |n| prime?(n, cache: cache) }
  end

  def self.natural_numbers
    Enumerator::Lazy.new(1..Float::INFINITY) do |y, v|
      predicate = yield(v)
      y << v if predicate
    end
  end

  def self.prime?(number, cache: false)
    if number <= PRIMES.last
      PRIMES.include?(number)
    elsif PRIMES.any? { |prime| (number % prime).zero? }
      false
    else
      prime = !(PRIMES.last...((number / 2).ceil)).any? do |factor|
        (number % factor).zero?
      end
      PRIMES << number if prime && cache
      prime
    end
  end
end
