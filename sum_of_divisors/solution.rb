require 'prime'

def list_squared(m, n)
    (m..n).map do |x|
      primes = x.prime_division.flat_map {|prime, freq| [prime] * freq}
      [x, ((1..primes.size).each_with_object([1]) do |n, result|
        result << primes.combination(n).map {|arr| arr.inject(&:*)}
      end << x).flatten.uniq.sum(&:abs2)]
    end.select {|_, sum| Math.sqrt(sum) % 1 == 0}
end
