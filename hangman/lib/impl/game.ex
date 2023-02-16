defmodule Hangman.Impl.Game do

# we can also convert it into a type by adding "@type t"
# this way type will have same name as defmodule

@type t :: %__MODULE__{
  turns_left: integer,
  game_state: Hangman.state,
  letters: list(String.t),
  letters_used: MapSet.t(String.t)
}

# this is a structure for the hangman game, it can be refered to as 'Hangman.Impl.Game'
# structure will always have the name of the module
defstruct(
  turns_left: 7,
  game_state: :initializing,
  letters: [],
  letters_used: MapSet.new()
)

#

  # def new_game do
    #  this is our internal state and will be initialized with the given values
    #  this will return the state to the outside world

    # we can also override the default values if needed

    # %__MODULE__{
    #   letters: Dictionary.random_word |> String.codepoints
    # }
    # below is equivalent to above expression
    # %Hangman.Impl.Game{
    #   letters: Dictionary.random_word |> String.codepoints
    # }

  # end

#

  def new_game do
    new_game(Dictionary.random_word)
  end

  def new_game(word) do
    %__MODULE__{
      letters: word |> String.codepoints
    }
  end

end
