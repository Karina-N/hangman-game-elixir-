defmodule TextClient.Runtime.RemoteHangman do

# this is only example script --> the server name MUST be the one you're using
  @remote_server :hangman@MacBookPro

  def connect() do
  :rpc.call(@remote_server, Hangman, :new_game, [])
  end

end
