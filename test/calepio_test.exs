defmodule CalepioTest do
  use ExUnit.Case
  doctest Calepio

  test "greets the world" do
    assert Calepio.hello() == :world
  end
end
