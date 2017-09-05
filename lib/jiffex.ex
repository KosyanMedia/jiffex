defmodule Jiffex do
  @moduledoc """
  Plain wrapper around :jiffy library to make it more usable in elixir projects.
  """

  @doc """
  Decodes `json`, in case of dicts uses `Map`s.

  iex> Jiffex.decode("{\\"a\\": 1, \\"b\\": null}")
  %{"a" => 1, "b" => nil}
  """
  def decode(json), do: :jiffy.decode(json, [:return_maps, :use_nil])

  @doc """
  Encodes elixir `term` to `json`

  iex> Jiffex.encode(%{"a" => 1, "b" => nil})
  "{\\"b\\":null,\\"a\\":1}"
  """
  def encode(term), do: :jiffy.encode(term, [:use_nil])
end
