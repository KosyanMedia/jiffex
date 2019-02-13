defmodule Jiffex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :jiffex,
      version: "0.2.0",
      name: "Jiffex",
      description: "A simple wrap over :jiffy library to use it in Elixir projects",
      elixir: "~> 1.6",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      source: "https://github.com/KosyanMedia/jiffex"
    ]
  end

  def application, do: [extra_applications: []]

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:jiffy, "~> 0.15"}
    ]
  end

  defp package do
    [
      name: "jiffex",
      licenses: ["BSD License"],
      maintainers: ["Anton Sidorov"],
      links: %{"GitHub" => "https://github.com/KosyanMedia/jiffex"}
    ]
  end
end
