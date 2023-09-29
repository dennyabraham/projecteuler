# frozen_string_literal: true

class Array
  def multiples_below(num)
    collect do |elem|
      elem.multiples_below num
    end.flatten.uniq
  end

  def sum_of_multiples_below(num)
    multiples_below(num).inject(0) { |acc, mult| acc + mult }
  end
end
