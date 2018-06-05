# Jiffex

Plain wrapper around :jiffy library to make it more usable in elixir projects.

## Upgrading from 0.1

Since `0.2` Jiffex moved from `encode/1` to `encode/1` and `encode!/1`, same thing happened for `decode/1`.

If you want to have plain result returned please upgrade to bang functions usage in your code.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `jiffex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:jiffex, git: "git@github.com:KosyanMedia/jiffex.git", tag: "0.2"}
  ]
end
```

## Usage

Decoding

```elixir
iex> Jiffex.decode("{\\"a\\": 1, \\"b\\": null}")
{:ok, %{"a" => 1, "b" => nil}}
```

Encoding

```elixir
iex> Jiffex.encode(%{"a" => 1, "b" => nil})
{:ok, "{\\"b\\":null,\\"a\\":1}"}
```
