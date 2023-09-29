# frozen_string_literal: true

def prime_factors(num)
  factors = []
  factor = 2
  while num > 1
    while (num % factor).zero?
      factors << factor
      num /= factor
    end
    factor += 1
  end
  factors
end

# prior implementation
#
# def prime_factors num
#   factors = []
#
#   #does not break if condition is reached early
#   if num > 1 then
#     for factor in 2..num do
#       while num % factor == 0
#         factors << factor
#         num /= factor
#       end
#     end
#   end
#
#   return factors
# end
