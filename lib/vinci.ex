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

    http_client.request(route[:method], url, params, headers)
      |> process_response(route[:result])
  end

  defp process_response({:ok, %{body: json_response}}, struct) do
    Poison.decode(json_response, as: struct)
  end

  defp http_client do
    Application.get_env(:vinci, :http_client)
  end
end
