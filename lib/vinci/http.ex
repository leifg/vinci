defmodule Vinci.Http do
  @doc "Issues an HTTP request"
  @callback request(method :: Keyword.t, url :: String.t, params :: %{}, headers :: %{}) :: {:ok, %{}} | {:ok, [%{}]} | {:error, %{}}
end
