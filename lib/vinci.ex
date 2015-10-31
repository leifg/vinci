defmodule Vinci do
  def call(api, route_id, params, headers) when is_atom(api) do
    config = Vinci.ConfigAgent.get_config(api)
    case config do
      nil -> { :error, "Configuration for #{api} not found" }
      _ -> call(config, route_id, params, headers)
    end
  end

  def call(api_config, route_id, params, headers) do
    route = api_config[:routes][route_id]

    { url, params } = Vinci.Url.modify(api_config[:endpoint] <> route[:path], params)

    {:ok, parsed_response} = http_client.request(route[:method], url, params, headers)
      |> Poison.decode(as: route[:result])
    parsed_response
  end

  defp http_client do
    Application.get_env(:vinci, :http_client)
  end
end
