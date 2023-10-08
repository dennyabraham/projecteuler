module Problem
  # a2 + b2 = c2
  # a + b + c = s
  # c = s - a - b
  # a2 + b2 = (s - a - b)2
  #         = s2 - sa - sb - sa + a2 + ba - sb + ab + b2
  #         = s2 - sa - sa - sb - sb + ab + ab + b2 + a2
  #       0 = s2 - 2sa - 2sb + 2ab
  # 2sa - 2ab = s2 - 2sb
  # a(2s - 2b) = s2 - 2sb
  # a = (s2 - 2sb) / (2s - 2b)
  #
  def self.triplet_with_sum(sum)
    c_min = case sum % 3
            when 2
              sum / 3 + 2
            else
              sum / 3 + 1
            end
    a_b = (1..(sum - c_min - 1)).map do |a|
      b_candidates = (1..(sum - c_min - a)).select do |b|
        a**2 + b**2 == (sum - a - b)**2
      end
      [a, b_candidates.first]
    end.select { |_, b| !b.nil? }
  end
end
