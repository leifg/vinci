defmodule Vinci.Http.HTTPoison do
  @behaviour Vinci.Http

  def request(method, url, params, headers) do
    HTTPoison.request(method, url, params, headers)
  end
end
