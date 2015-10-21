defmodule Vinci.Url do
  @doc """
  Replace parameters in URL by references in hash. Delete all matching keys from hash afterwards

      iex> Vinci.Url.modify("http://apisaurus/", %{})
      { "http://apisaurus/", %{} }

      iex> Vinci.Url.modify("http://apisaurus/", %{ id: 1})
      { "http://apisaurus/", %{ id: 1} }

      iex> Vinci.Url.modify("http://apisaurus/dinosaurs/:name", %{ name: "trex"})
      { "http://apisaurus/dinosaurs/trex", %{} }

      iex> Vinci.Url.modify("http://apisaurus/dinosaurs/:id", %{ id: 1})
      { "http://apisaurus/dinosaurs/1", %{} }

      iex> Vinci.Url.modify("http://apisaurus/dinosaurs/:id", %{ id: 1, name: "trex"})
      { "http://apisaurus/dinosaurs/1", %{ name: "trex" } }
  """
  def modify(url, params) do
    url_params = Regex.scan(~r/:([^\/]+)/, url, capture: :all)
                    |> Enum.map(&(Enum.reverse(&1) |> Enum.take(1)))
                    |> List.flatten
                    |> Enum.map(&String.to_atom/1)
    Enum.reduce(url_params, {url, params}, fn(url_param, acc) ->
      { acc_url, acc_params } = acc
      {
        Regex.replace(
          ~r/\:#{url_param}/,
          acc_url,
          Dict.get(acc_params, url_param) |> to_string
        ),
        Dict.delete(acc_params, url_param),
      }
    end)
  end
end
