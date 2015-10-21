defmodule Vinci.Http do
  @doc "..."
  @callback request(method :: Keyword.t, url :: String.t, params :: %{}) :: %{} | [%{}]
end
