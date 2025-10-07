defmodule Nathanwhyte.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NathanwhyteWeb.Telemetry,
      Nathanwhyte.Repo,
      {DNSCluster, query: Application.get_env(:nathanwhyte, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Nathanwhyte.PubSub},
      # Start a worker by calling: Nathanwhyte.Worker.start_link(arg)
      # {Nathanwhyte.Worker, arg},
      # Start to serve requests, typically the last entry
      NathanwhyteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nathanwhyte.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NathanwhyteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
