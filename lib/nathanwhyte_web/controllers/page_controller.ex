defmodule NathanwhyteWeb.PageController do
  use NathanwhyteWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
