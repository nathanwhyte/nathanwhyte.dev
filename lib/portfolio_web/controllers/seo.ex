defmodule PortfolioWeb.SEO do
  use PortfolioWeb, :verified_routes

  use SEO,
    json_library: Jason,
    # a function reference will be called with a conn during render
    # arity 1 will be passed the conn, arity 0 is also supported.
    site: &__MODULE__.site_config/1,
    open_graph: &__MODULE__.og_config/1

  def og_config(conn) do
    SEO.OpenGraph.build(
      description: "My portfolio website.",
      site_name: "Nathan Whyte · Full Stack Engineer",
      locale: "en_US",
      url: url(conn, ~p"/"),
      image: static_url(conn, "/images/Headshot.png")
    )
  end

  # Or arity 0 is also supported, which can be great if you're using
  # Phoenix verified routes and don't need the conn to generate paths.
  def site_config(_conn) do
    SEO.Site.build(
      default_title: "Nathan Whyte",
      description: "My portfolio website.",
      title_suffix: " · Full Stack Engineer",
      theme_color: "#8b5cf6",
      windows_tile_color: "#8b5cf6"
    )
  end
end
