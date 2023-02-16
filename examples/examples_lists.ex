require Integer

defmodule Lists do

  def len([]), do: 0
  def len([ _h | t]), do: 1 + len(t)

  def double([]), do: []
  def double([ h | t ]), do: [ 2*h | double(t) ]

  def square([]), do: []
  def square([ h | t ]), do: [ h*h | square(t) ]

  def divide([]), do: []
  def divide([h|t]), do: [h/2 | divide(t)]

  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def sum_pairs([]), do: []
  def sum_pairs([ h1, h2 | t ]), do: [ h1+h2 | sum_pairs(t)]

  def sum_odds([]), do: []
  def sum_odds([ h1, h2, h3 | t ]), do: [ h1+h2+h3 | sum_odds(t)]

  def even_length([]), do: true
  def even_length([ _h | t ]), do: Integer.is_even(1 + len(t))

  def map([], _func), do: []
  def map([h|t], func), do: [func.(h) | map(t,func)]


  # Two syntaxes below arte equal, of how to use MAP METHOD

  # iex> Enum.map [1,2,3], fn (x) -> x*2 end
  # [2, 4, 6]

  # using ampersand -> & -> it is called anonymous function
  # iex> Lists.map [1,2,3], &(&1 * 2)
  # [2, 4, 6]

  end
