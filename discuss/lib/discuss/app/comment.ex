defmodule Discuss.App.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Discuss.App.{User, Topic}

  @derive {Jason.Encoder, only: [:content]}

  schema "comments" do
    field :content, :string
    belongs_to :user, User
    belongs_to :topic, Topic

    timestamps();
  end

  def changeset(comment, params \\ %{}) do
    comment
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
