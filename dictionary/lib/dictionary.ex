defmodule Dictionary do

# this is called module attribute @word_list (in our case)
# it is created at compile time
# its nitial value determined after running some initial elixir code


@word_list "assets/words.txt"
|> File.read!()
|> String.split(~r/\n/, trim: true)

  def random_word do
    @word_list
    |> Enum.random()
  end
end
