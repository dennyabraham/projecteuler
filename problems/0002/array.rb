class Array
  
  def second_to_last
    return self[size - 2]
  end
  
  def sum
    return inject { |acc, elem| acc + elem }
  end
  
end