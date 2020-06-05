defmodule BoilingPoint.Repo do
  use Ecto.Repo,
    otp_app: :boiling_point,
    adapter: Ecto.Adapters.Postgres
end
