class Problem
  PRIMES = [2, 3, 5, 7]

  class << self
    def tth_prime(n)
      PRIMES[n] || primes.first(n + 1).last
    end

    def prime_score(list)
      list.sum do |elem|
        tth_prime(elem)
      end
    end

    def all_primes_to(n)
      if PRIMES[n + 1]
        PRIMES.first(n + 1)
      else
        primes.first(n + 1)
      end
    end

    # TODO: optimize
    def maximal_multiple_prime_score(k, n)
      candidate_list_lazy(k, n).reduce(0) do |max_score, list|
        if (score = prime_score(list)) > max_score && (score % k == 0)
          score
        else
          max_score
        end
      end
    end

    def candidate_lists(k, n)
      lists = []
      candidate_list(lists, [], n, (0..(k-1)))
      lists.map(&:sort).uniq
    end

    def candidate_list(lists, head, max_len, candidate_elems)
      if head.size + 1 == max_len
        candidate_elems.each do |elem|
          lists << head + [elem]
        end
      else
        candidate_elems.each do |elem|
          candidate_list(lists, head + [elem], max_len, candidate_elems)
        end
      end
    end

    def candidate_list_lazy(base, max_len)
      # base = 2
      Enumerator::Lazy.new(base.downto(0)) do |yielder, i|
        list = Array.new(max_len, i)
        # for i generate all combos with all numbers after i
        (1..max_len).each do |position|
          (base - 1).downto(i + 1) do |num|
            list[position * -1] = num
            yielder << list
          end
        end
      end
    end

    def candidate_list_distributions(base, max_len)
      number = base ** max_len
      results = []
      list = Array.new(base, 0)
      list[0] = max_len

      results << list.dup

      # until(results.last.last == max_len)
      7.times do
        list = list.dup
        only_zeroes_from_end = true
        list.reverse_each.with_index do |elem, ridx|
          if only_zeroes_from_end && elem == 0
            next
          elsif only_zeroes_from_end && ridx > 0
            only_zeroes_from_end = false
            list[-ridx - 1] -= 1
            list[-ridx] += 1
          else
            only_zeroes_from_end = false
            list[-ridx - 1] -= 1
            list[-ridx] = 
          end

          results << list.dup
        end
      end

      results
    end

    def primes
      natural_numbers { |n| prime?(n) }
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

    def prime?(number, sequential: false)
      if number <= PRIMES.last
        PRIMES.include?(number)
      elsif PRIMES.any? { |prime| (number % prime).zero? }
        false
      elsif sequential # idk what this does
        PRIMES << number
        true
      else
        prime = !(PRIMES.last...((number / 2).ceil)).any? do |factor|
          (number % factor).zero?
        end
        PRIMES << number if prime
        prime
      end
    end
  end
end
