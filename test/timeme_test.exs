defmodule TimemeTest do
  use ExUnit.Case
  doctest Timeme

  test "greets the world" do
    assert Timeme.hello() == :world
  end
end
