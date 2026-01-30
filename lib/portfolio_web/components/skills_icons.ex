defmodule PortfolioWeb.SkillsIcons do
  @moduledoc false

  use PortfolioWeb, :html

  @png_names ["tanstack"]
  @name_to_alt %{
    "actions" => "GitHub Actions",
    "cloudflare" => "Cloudflare",
    "css" => "CSS",
    "docker" => "Docker",
    "drizzle" => "Drizzle",
    "elixir" => "Elixir",
    "fastapi" => "FastAPI",
    "grafana" => "Grafana",
    "html" => "HTML",
    "java" => "Java",
    "javascript" => "JavaScript",
    "kubernetes" => "Kubernetes",
    "linux" => "Linux",
    "nextjs" => "Next.js",
    "nginx" => "Nginx",
    "phoenix" => "Phoenix",
    "postgres" => "PostgreSQL",
    "prometheus" => "Prometheus",
    "python" => "Python",
    "react" => "React",
    "redux" => "Redux",
    "ruby" => "Ruby",
    "rust" => "Rust",
    "spring" => "Spring",
    "sqlalchemy" => "SQLAlchemy",
    "tailwind" => "Tailwind CSS",
    "tanstack" => "TanStack Form",
    "typescript" => "TypeScript",
    "websocket" => "WebSocket",
    "zustand" => "Zustand"
  }

  attr :name, :string, required: true
  attr :alt, :string, default: nil
  attr :class, :string, default: "size-6"

  def icon(assigns) do
    name = assigns.name
    ext = if name in @png_names, do: ".png", else: ".svg"
    alt = assigns[:alt] || Map.get(@name_to_alt, name) || default_alt(name)

    assigns =
      assigns
      |> assign(:ext, ext)
      |> assign(:alt, alt)

    ~H"""
    <img src={"/images/skills_icons/#{@name}#{@ext}"} alt={@alt} class={@class} />
    """
  end

  defp default_alt(name), do: String.replace(name, "_", " ") |> String.capitalize()
end
