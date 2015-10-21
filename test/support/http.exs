defmodule Vinci.InMemory do
  @endpoint "http://apisaurus"

  def request(:get, "#{@endpoint}/all", %{}) do
    Vinci.Fixtures.dinosaurs |> to_json
  end

  def request(:get, "#{@endpoint}/dinosaurs/" <> id, %{}) do
    Vinci.Fixtures.dinosaur_by_id(id) |> to_json
  end

  def request(:post, "#{@endpoint}/dinosaurs", _params) do
    Vinci.Fixtures.created_dinosaur |> to_json
  end

  defp to_json(body) do
    {:ok, json} = body |> Poison.encode
    json
  end
end
