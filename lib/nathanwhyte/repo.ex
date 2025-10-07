defmodule Nathanwhyte.Repo do
  use Ecto.Repo,
    otp_app: :nathanwhyte,
    adapter: Ecto.Adapters.Postgres
end
