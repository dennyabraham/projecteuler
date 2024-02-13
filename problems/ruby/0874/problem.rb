class Problem
  PRIMES = [2, 3, 5, 7]
  PRIME_SCORES = {}
  class << self
    def tth_prime(n)
      return PRIME_SCORES[n] if PRIME_SCORES[n]
      prime = primes(cache: true).first(n + 1).last
      PRIME_SCORES[n] = prime
    end

    def prime_score(list)
      list.sum do |elem|
        tth_prime(elem)
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
          # for each replace all up to position with other
        end
      end
      #Enumerator::Lazy.new((base**max_len).downto(0)) do |yielder, idx|
      #  list = Array.new(max_len) { 0 }

       # (max_len.downto(0)).each do |position|
        #  one = base ** position

#          while(idx > one)
 #           idx -= one
  #          list[max_len - position - 1] += 1
   #       end
    #    end
     #   yielder << list
      #end
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
