defmodule Pow.Phoenix.ControllerTest do
  defmodule Callbacks do
    def callback(TestController, :create, :ok, _config), do: :changed
  end

  use ExUnit.Case
  doctest Pow.Phoenix.Controller

  alias Pow.Phoenix.Controller

  test "callback/4" do
    assert Controller.callback(:ok, TestController, :create, []) == :ok

    config = [controller_callbacks: Callbacks]
    assert Controller.callback(:ok, TestController, :create, config) == :changed
  end
end