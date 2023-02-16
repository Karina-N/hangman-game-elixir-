defmodule Hangman.Impl.Game do

alias Hangman.Type

@type t :: %__MODULE__{
  turns_left: integer,
  game_state: Type.state,
  letters: list(String.t),
  letters_used: MapSet.t(String.t)
}

defstruct(
  turns_left: 7,
  game_state: :initializing,
  letters: [],
  letters_used: MapSet.new()
)

  @spec new_game() :: t
  def new_game do
    new_game(Dictionary.random_word)
  end

  @spec new_game(String.t) :: t
  def new_game(word) do
    %__MODULE__{
      letters: word |> String.codepoints
    }
  end

end
