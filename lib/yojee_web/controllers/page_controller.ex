defmodule YojeeWeb.PageController do
  use YojeeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
