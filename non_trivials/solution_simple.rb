require 'prime'

def print_nontrivials(min, max)
  seed = Math.sqrt(Math.sqrt(min).ceil).ceil
  Prime.each do |prime|
    next if prime < seed
    next_val = prime ** 4
    break if next_val > max
    puts "#{next_val} #{next_val / prime}"
  end
end

print_nontrivials(50034679, 92136895)
