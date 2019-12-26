defmodule Discuss.User.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss.User.{Profile, Comment}

  schema "topics" do
    field :title, :string
    belongs_to :profile, Profile
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(topic, params \\ %{}) do
    topic
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
