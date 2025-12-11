def test_rocket_notation
  rocket_double = { "one" => "first" } # rubocop:disable Style/StringLiterals
  rocket_single = { 'two' => 'second' }
  rocket_mix = { 'mix "hmm"' => 'second' }
  symbol = { three: 'second' }
  multi = { 'a' => 'apple', 'b' => 'banana', c: :carrot, 'd "D"' => 'date', 'abc_123' => 'first' }
  [rocket_double, rocket_single, symbol, rocket_mix, multi]
end
