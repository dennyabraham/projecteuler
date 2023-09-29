# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/array"

class Fibonacci
  class << self
    def terms_below(num)
      terms = [1, 1]
      terms << terms.last + terms.second_to_last while terms.last < num
      terms[1..terms.size - 2]
    end

    def even_terms_below(num)
      terms_below(num).find_all(&:even?)
    end

    def sum_of_even_terms_below(num)
      even_terms_below(num).sum
    end
  end
end
