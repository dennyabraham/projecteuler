# frozen_string_literal: true

class Array
  def second_to_last
    self[size - 2]
  end

  def sum
    inject { |acc, elem| acc + elem }
  end
end
