require 'prime'

class NonTrivials
  def initialize(min = 1)
    @min = min
  end

  def each
    seed = Math.sqrt(Math.sqrt(@min).ceil).ceil
    Prime.each do |prime|
      next if prime < seed
      next_val = prime ** 4
      yield [next_val, next_val / prime]
    end
  end
end

NonTrivials.new(50034679).to_enum
.take_while {|n, _| n <= 92136895}
.each {|n, d| puts "#{n} #{d}"}
