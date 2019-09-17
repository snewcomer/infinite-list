defmodule InfiniteList.Repo do
  use Ecto.Repo,
    otp_app: :infinite_list,
    adapter: Ecto.Adapters.Postgres
end
