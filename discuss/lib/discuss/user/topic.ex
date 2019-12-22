defmodule Discuss.User.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :title, :string
    belongs_to :profile, Discuss.User.Profile

    timestamps()
  end

  @doc false
  def changeset(topic, params \\ %{}) do
    topic
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
