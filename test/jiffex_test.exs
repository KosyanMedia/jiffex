defmodule JiffexTest do
  use ExUnit.Case
  doctest Jiffex

  describe "encode!/1" do
    test "returns result on success" do
      assert Jiffex.encode!(%{"a" => 1, "b" => nil}) == "{\"b\":null,\"a\":1}"
    end

    test "raises error on error" do
      assert_raise RuntimeError, fn -> Jiffex.encode!({}) end
    end
  end

  describe "decode!/1" do
    test "returns result on error" do
      assert Jiffex.decode!("{\"a\": 1, \"b\": null}") == %{"a" => 1, "b" => nil}
    end

    test "raises error on error" do
      assert_raise RuntimeError, fn -> Jiffex.decode!("something wrong here") end
    end
  end
end
