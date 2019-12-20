defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.User.Profile

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider} = params) do

    user_params = %{token: auth.credentials.token,
                    email: auth.info.email,
                    provider: provider}

    changeset = Profile.changeset(%Profile{}, user_params)

    insert_or_update_user(changeset)

  end

  defp insert_or_update_user(changeset) do

    case Repo.get_by(Profile, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end

end
