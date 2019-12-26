defmodule Discuss.CommentsChannel do
  use DiscussWeb, :channel

  alias Discuss.Repo
  alias Discuss.User.Topic

  def join("comments:" <> topic_id, _params, socket) do
    topic_id = String.to_integer(topic_id)

    topic = Repo.get(Topic, topic_id)
    {:ok, %{}, socket}
  end

  def handle_in(name, %{"content" => content}, socket) do
    IO.inspect(message)
    {:reply, :ok, socket}
  end

end
