defmodule TextClient.Impl.Player do

  @typep game :: Hangman.game
  @typep tally :: Hangman.Type.tally()
  @typep state :: { game, tally }

  @spec start() :: :ok
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({ game, tally })
  end

  @spec interact(state) :: :ok
  def interact({ _game, _tally = %{ game_state: :won } }) do
    IO.puts "Congratulations. You won!"
  end

  def interact({ _game, tally = %{ game_state: :lost } }) do
    IO.puts "Sorry, you lost... the word was #{tally.letters |> Enum.join}"
  end

  def interact({ game, tally }) do
    # feedback (how to get info from the tally)
    IO.puts feedback_for(tally)

    # display current word
    IO.puts current_word(tally)

    # make move (has to call hamgman.make_move )
    # interact()
  end

  def feedback_for(tally = %{ game_state: :initializing }) do
    "Welcome! I'm thinking of a #{tally.letters |> length} letter word"
  end

  def feedback_for(%{ game_state: :good_guess }), do: "Good guess!"
  def feedback_for(%{ game_state: :bad_guess }) , do: "Bad guess..."
  def feedback_for(%{ game_state: :already_used }), do: "You already tried this letter..."

  def current_word(tally) do
    [
      "Word so far: ", tally.letters |> Enum.join(" "),
      "   turns left: ", tally.turns_left |> to_string,
      "   used so far: ", tally.letters_used |> Enum.join(",")
    ]
  end
end
