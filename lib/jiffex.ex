defmodule Jiffex do
  @moduledoc """
  Plain wrapper around :jiffy library to make it more usable in elixir projects.
  """

  @default_decode_options [:return_maps, :use_nil, :copy_strings]

  defdelegate encode_to_iodata!(content), to: Jiffex, as: :encode!

  @doc """
  Decodes `json`, in case of dicts uses `Map`s.
  Returns `{:ok, result}` or `{:error, reason}`

  iex> Jiffex.decode("{\\"a\\": 1, \\"b\\": null}")
  {:ok, %{"a" => 1, "b" => nil}}

  iex> Jiffex.decode("something wrong here")
  {:error, {1, :invalid_json}}
  """
  def decode(json) do
    {:ok, :jiffy.decode(json, @default_decode_options)}
  catch
    {:error, reason} -> {:error, reason}
  end

  @doc """
  See `decode/1` for details, works the similar way,
  but returns `result` and raises in case of error.
  """
  def decode!(json) do
    case decode(json) do
      {:ok, result} -> result
      {:error, reason} -> raise RuntimeError, "Json decode error #{inspect reason}"
    end
  end

  @default_encode_options [:use_nil]

  @doc """
  Encodes elixir `term` to `json`
  Returns `{:ok, result}` or `{:error, reason}`

  iex> Jiffex.encode(%{"a" => 1, "b" => nil})
  {:ok, "{\\"b\\":null,\\"a\\":1}"}

  iex> Jiffex.encode({})
  {:error, {:invalid_ejson, {}}}
  """
  def encode(term) do
    {:ok, :jiffy.encode(term, @default_encode_options)}
  catch
    {:error, reason} -> {:error, reason}
  end

  @doc """
  See `encode/1` for details, works the similar way,
  but returns `result` and raises in case of error.
  """
  def encode!(term) do
    case encode(term) do
      {:ok, result} -> result
      {:error, reason} -> raise RuntimeError, "Json encode error #{inspect reason}"
    end
  end
end
