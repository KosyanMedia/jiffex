defmodule Jiffex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :jiffex,
      version: "0.2.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application, do: [extra_applications: []]

  defp deps, do: [{:jiffy, "~> 0.15"}]

  defp package do
    [
      files: ["lib", "mix.exs", "README.md"],
      maintainers: ["Anton Sidorov"],
      links: %{"GitHub" => "https://github.com/KosyanMedia/jiffex"}
    ]
  end
end
