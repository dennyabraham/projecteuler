# frozen_string_literal: true

class Integer
  def multiples_below(num)
    multiples = []
    (1..num - 1).each do |i|
      multiples << i if (i % self).zero?
    end
    multiples
  end
end
