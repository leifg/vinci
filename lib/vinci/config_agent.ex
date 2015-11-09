defmodule Vinci.ConfigAgent do
  @name __MODULE__

  def start_link do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  def add_config(key, config) do
    start_link
    Agent.update(@name, fn global_config ->
      Map.put(global_config, key, config)
    end)
  end

  def get_config(key) do
    Agent.get(@name, fn global_config -> Map.get(global_config, key) end)
  end
end
