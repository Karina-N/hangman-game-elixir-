defmodule Patterns do

  # syntax option 1
  def swap_values1({a,b}) do
    {b,a}
  end

  #  syntax option 2
  def swap_values2({a,b}), do: {b,a}


  def check_if_same(a,a), do: true
  def check_if_same(b,c), do: false
  # def check_if_same(_,_), do: false
end
