defmodule Calepio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  def start(_type, _args) do
    Logger.info "Starting Calepio"

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Calepio.Worker.start_link(arg)
      # {Calepio.Worker, arg},
      Plug.Adapters.Cowboy.child_spec(:http, Calepio.Web.Router, [], [port: 4001])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Calepio.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
