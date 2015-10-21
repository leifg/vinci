defmodule Vinci do
  def call(api_config, route_id, params) when is_map(api_config) do
    route = api_config[:routes][route_id]

    { url, params } = Vinci.Url.modify(api_config[:endpoint] <> route[:path], params)

    {:ok, parsed_response} = http_client.request(route[:method], url, params)
      |> Poison.decode(as: route[:result])
    parsed_response
  end

  def call(api, route_id, params) do
    call(Application.get_env(:vinci, api), route_id, params)
  end

  defp http_client do
    Application.get_env(:vinci, :http_client)
  end
end
