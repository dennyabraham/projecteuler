class Fixnum
  
  def multiples_below num
    multiples = []
    for i in 1..num-1
      multiples << i if i%self == 0
    end
    return multiples
  end
  
end