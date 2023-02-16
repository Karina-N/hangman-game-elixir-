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

### NEW_GAME ###########################################

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

### MAKE_MOVE ##########################################

  @spec make_move(t, String.t) :: { t, Type.tally }
  def make_move(game = %{ game_state: state} , _guess)
  when state in [:won, :lost] do
    #  if game is won or lost we exit, and return exisitng state
    game
    |> return_with_tally()
  end

  def make_move(game, guess) do
    #  here we're asking if 'guess' appears in 'letters_used'
    #  question mark means it returns true/false

    # if game is NOT won or lost, we accept the letter
    # with accept_letter method we also check if we've already seen the letter
    accept_guess(game, guess, MapSet.member?(game.letters_used, guess))
    |> return_with_tally()
  end

### ACCEPT_GUESS #########################################

  defp accept_guess(game, _guess, _already_used = true) do
    #  if we've seen the letter, we return state of already_used
    %{game | game_state: :already_used}
  end

  defp accept_guess(game, guess, _already_used) do
    #  if we have not seen the letter, we add it to the letters_used
    %{game | letters_used: MapSet.put(game.letters_used, guess)}
    |> score_guess(Enum.member?(game.letters, guess))
  end

### SCORE_GUESS ########################################################

defp score_guess(game, _good_guess = true) do
  #  guessed all letters -> :won | :good_guess
  new_state = maybe_won(MapSet.subset?(MapSet.new(game.letters), game.letters_used))
  %{game | game_state: new_state}
end

defp score_guess(game, _bad_guess) do
  #  turns_left == 1 -> lost OR decrement turns_left & :bad_guess
  game
end

###########################################################

  defp tally(game) do
    %{
      turns_left: game.turns_left,
      game_state: game.game_state,
      letters: [],
      letters_used: game.letters_used |> MapSet.to_list |> Enum.sort
    }
  end

  defp return_with_tally(game) do
    {game, tally(game)}
  end

  defp maybe_won(true), do: :won
  defp maybe_won(_), do: :good_guess

end
