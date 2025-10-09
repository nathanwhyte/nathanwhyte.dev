defmodule NathanwhyteWeb.NavbarTest do
  use NathanwhyteWeb.ConnCase, async: true

  describe "navbar content and functionality" do
    test "navbar left side has expected content" do
      conn = get(build_conn(), ~p"/")
      html = html_response(conn, 200)

      # Test navbar presence and structure
      assert html =~ ~r/<header[^>]*class="navbar/

      # Test brand section
      assert html =~ ~r/href="\/"/
      assert html =~ ~r/class="hero-command-line/
      assert html =~ "Nathan Whyte"
    end

    test "navbar right side has expected links and icons" do
      conn = get(build_conn(), ~p"/")
      html = html_response(conn, 200)

      # Check that external links are present
      assert html =~ ~r/href="https:\/\/github\.com\/nathanwhyte"/
      assert html =~ ~r/href="https:\/\/www\.linkedin\.com\/in\/nathan-whyte\/"/

      # Check that icons are present
      assert html =~ ~r/class="[^"]*hero-command-line[^"]*"/
      assert html =~ ~r/class="[^"]*custom-icon-github[^"]*"/
      assert html =~ ~r/class="[^"]*custom-icon-linkedin[^"]*"/
    end
  end
end
