defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.User.Topic

  def new(conn, params) do

    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end
end
