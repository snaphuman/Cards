defmodule DiscussWeb.UserSocket do
  use Phoenix.Socket

  channel "comments:*", Discuss.CommentsChannel

  def connect(%{"token" => token}, socket, _connect_info) do
    case Phoenix.Token.verify(socket, "secret", token) do
      {:ok, user_id} ->
        {:ok, assign(socket, :user_id, user_id)}
      {:error, _error} ->
        :error
    end
    {:ok, socket}
  end

  def id(_socket), do: nil
end
