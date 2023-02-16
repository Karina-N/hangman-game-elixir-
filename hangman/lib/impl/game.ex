defmodule Hangman.Impl.Game do

# we can also convert it into a type by adding "@type t"
# this way type will have same name as defmodule

@type t :: %Hangman.Impl.Game{
  turn_left: integer,
  game_state: Hangman.state,
  letters: list(String.t),
  letters_used: MapSet.t(String.t)
}

# this is a structure for the hangman game, it can be refered to as 'Hangman.Impl.Game'
defstruct(
  turn_left: 7,
  game_state: :initializing,
  letters: [],
  letters_used: MapSet.new()
)

  def new_game do
    #  this is our internal state and will be initialized with the given values
    #  this will return the state to the outside world

    # we can also override the default values if needed
    %Hangman.Impl.Game{
      letters: Dictionary.random_word |> String.codepoints
    }

  end

end
