defmodule NathanwhyteWeb.HomePageLiveTest do
  use NathanwhyteWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, ~p"/")

    assert disconnected_html =~ "Nathan Whyte"

    assert render(page_live) =~ "Nathan Whyte"
  end
end
