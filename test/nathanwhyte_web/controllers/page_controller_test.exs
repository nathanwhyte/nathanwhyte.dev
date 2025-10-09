defmodule NathanwhyteWeb.PageControllerTest do
  use NathanwhyteWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    html = html_response(conn, 200)

    # Make sure navbar is present
    assert html =~ ~r/<header[^>]*class="navbar/
    assert html =~ "Nathan Whyte"

    # TODO: update tests when more home page content is added
  end
end
