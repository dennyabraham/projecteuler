module ProblemFive
  def self.sum(table)
    table.reduce(1) do |product, (factor, times)|
      product * (factor ** times)
    end
  end

  def self.factors(number)
    table = {}
    (2..number).each do |factor|
      while (number % factor).zero?
        table[factor] ||= 0
        table[factor] += 1
        number = number / factor
      end
    end
    table
  end

  def self.merge(*tables)
    result = {}
    tables.each do |table|
      table.each do |k, v|
        result[k] ||= 0
        result[k] = [result[k], v.to_i].max
      end
    end
    result
  end
end
