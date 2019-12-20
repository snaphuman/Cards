defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth

  alias Discuss.User.Profile

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider} = params) do

    user_params = %{token: auth.credentials.token,
                    email: auth.info.email,
                    provider: provider}

    changeset = Profile.changeset(%Profile{}, user_params)

  end
end
