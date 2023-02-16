defmodule Hangman do

alias Hangman.Impl.Game, as: Game
# equivalent to syntax above, by default alias will use the last name
# alias Hangman.Impl.Game

# @opaque defines a type whose contents are not usable outside this module (this is how we secure internal state)

@type state :: :initializing | :won | :lost | :good_guess | :bad_guess | :already_used
@opaque game :: Game.t
@type tally :: %{
  turns_left: integer,
  game_state: state,
  letters: list(String.t),
  letters_used: list(String.t)
}

@spec new_game() :: game

defdelegate new_game, to: Game

#  below code is equivalent to line above
  # def new_game do
  #   Game.new_game()
  # end

@spec make_move(game, String.t) :: { game, tally }
  def make_move(_game, _guess) do
  end
end
