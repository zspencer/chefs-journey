defmodule BoilingPointWeb.HomeController do
  use BoilingPointWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
