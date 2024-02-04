class Problem
  PRIMES = [2, 3, 5, 7]

  class << self
    def tth_prime(n)
      primes(cache: true).first(n + 1).last
    end

    def prime_score(list)
      list.sum do |elem|
        tth_prime(elem)
      end
    end

    def primes(cache: false, sequential: false)
      natural_numbers { |n| prime?(n, cache: cache, sequential: sequential) }
    end

    def natural_numbers
      Enumerator::Lazy.new(1..Float::INFINITY) do |y, v|
        predicate = yield(v)
        y << v if predicate
      end
    end

    def natural_numbers_list
      Enumerator::Lazy.new(1..Float::INFINITY) do |y, v|
        y << v
      end
    end

    def prime?(number, cache: false, sequential: false)
      if number <= PRIMES.last
        PRIMES.include?(number)
      elsif PRIMES.any? { |prime| (number % prime).zero? }
        false
      elsif sequential
        PRIMES << number if cache
        true
      else
        prime = !(PRIMES.last...((number / 2).ceil)).any? do |factor|
          (number % factor).zero?
        end
        PRIMES << number if prime && cache
        prime
      end
    end
  end
end
