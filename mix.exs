defmodule Stripe.Mixfile do
  use Mix.Project

  def project do
    [ app: :stripity_stripe,
      version: "1.4.0",
      description: "A Stripe Library for Elixir",
      package: package,
      elixir: "~> 1.1",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      deps: deps(Mix.env) ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [:httpoison],
      mod: { Stripe, [] }
    ]
  end

  defp deps(:dev) do
    deps(:prod)
  end

  defp deps(:test) do
    deps(:dev)
  end

  defp deps(:prod) do
    [
      {:httpoison, "~> 0.8.2" },
      {:poison, "~> 1.5 or ~> 2.1.0", optional: true},
      {:ex_doc, "~> 0.7", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:excoveralls, "~> 0.5.4", only: :test},
      {:inch_ex, "~> 0.5.1", only: [:dev, :test]}
    ]
  end

  def package do
    [
      maintainers: ["Rob Conery","Nic Rioux"],
      licenses: ["New BSD"],
      links: %{"GitHub" => "https://github.com/robconery/stripity-stripe"}
    ]
  end

end
