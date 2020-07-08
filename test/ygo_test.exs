defmodule YGOTest do
  use ExUnit.Case
  doctest YGO

  test "greets the world" do
    assert YGO.hello() == :world
  end
end
