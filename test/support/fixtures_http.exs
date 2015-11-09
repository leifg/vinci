defmodule Vinci.Http.FixturesHttp do
  @behaviour Vinci.Http
  @endpoint "http://apisaurus"

  def request(:get, "#{@endpoint}/all", _params, _headers) do
    Vinci.Fixtures.dinosaurs |> to_http_response
  end

  def request(:get, "#{@endpoint}/dinosaurs/" <> id, _params, _headers) do
    Vinci.Fixtures.dinosaur_by_id(id) |> to_http_response
  end

  def request(:post, "#{@endpoint}/dinosaurs", _params, _headers) do
    Vinci.Fixtures.created_dinosaur |> to_http_response
  end

  defp to_http_response(fixture) do
    { :ok, json } = Poison.encode(fixture)
    { :ok, %{ body: json } }
  end
end
