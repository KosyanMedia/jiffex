# Jiffex

Plain wrapper around :jiffy library to make it more usable in elixir projects.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `jiffex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:jiffex, git: "https://github.com/KosyanMedia/jiffex.git", tag: "0.1"}
  ]
end
```

## Usage

Decoding

```elixir
iex> Jiffex.decode("{\\"a\\": 1, \\"b\\": null}")
%{"a" => 1, "b" => nil}
```

Encoding

```elixir
iex> Jiffex.encode(%{"a" => 1, "b" => nil})
"{\\"b\\":null,\\"a\\":1}"
```
