defmodule YgoTest do
  use ExUnit.Case
  doctest Ygo

  test "greets the world" do
    assert Ygo.hello() == :world
  end
end
