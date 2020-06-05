defmodule BoilingPoint.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BoilingPoint.Repo,
      # Start the Telemetry supervisor
      BoilingPointWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BoilingPoint.PubSub},
      # Start the Endpoint (http/https)
      BoilingPointWeb.Endpoint
      # Start a worker by calling: BoilingPoint.Worker.start_link(arg)
      # {BoilingPoint.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BoilingPoint.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BoilingPointWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
