require File.dirname(__FILE__) + '/array'

class Fibonacci
  
  class << self
  
    def terms_below num
      terms = [1, 1]
      while(terms.last < num)
        terms << terms.last + terms.second_to_last
      end
      return terms[1..terms.size - 2]
    end
    
    def even_terms_below num
      return terms_below(num).find_all{ |term| term %2 == 0 }
    end
    
    def sum_of_even_terms_below num
      return even_terms_below(num).sum
    end
    
  end
  
end