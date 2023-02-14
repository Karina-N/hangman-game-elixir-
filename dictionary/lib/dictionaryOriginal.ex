defmodule Dictionary do

    def word_list do
      # option1

      # words = File.read!("assets/words.txt")
      # String.split(words, ~r/\n/, trim: true)

      # option2

      # this is called 'pipeline operator' --->>>   |>
      # pipeline says: take expression on the left
      # and pass it as the first parameter to the function on the right

      "assets/words.txt"
      |> File.read!()
      |> String.split(~r/\n/, trim: true)
    end

    def random_word do

      # option1
      # Enum.random(word_list())

      # option2

      word_list()
      |> Enum.random()
    end
  end
