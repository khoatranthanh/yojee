defmodule YojeeWeb.ErrorView do
  use YojeeWeb, :view

  def render("404.json", _assigns) do
    %{errors: %{message: "Endpoint not found!"}}
  end

  def render("500.json", _assigns) do
    %{errors: %{message: "Internal server error :("}}
  end
end
