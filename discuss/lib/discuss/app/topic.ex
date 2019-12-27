defmodule Discuss.App.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss.App.{User, Comment}

  schema "topics" do
    field :title, :string
    belongs_to :user, User
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
