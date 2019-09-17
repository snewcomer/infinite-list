defmodule InfiniteListWeb.PageController do
  use InfiniteListWeb, :controller


  def index(conn, _params) do
    render(conn, "index.html")
  end

  def artwork(conn, _params) do
    render(conn, "artwork.html")
  end
end
