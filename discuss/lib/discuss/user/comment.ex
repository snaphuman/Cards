defmodule Discuss.User.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.User.Profile
    belongs_to :topic, Discuss.User.Topic
  end

  def changesets(comment, params \\ %{}) do
    comment
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
