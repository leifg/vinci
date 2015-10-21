use Mix.Config

config :vinci, :http_client, Vinci.InMemory

config :vinci, :apisaurus, %{
  endpoint: "http://apisaurus",
  routes: %{
    all: %{
      method: :get,
      path: "/all",
      result: [Vinci.Fixtures.Dinosaur]
    },
    create: %{
      method: :post,
      path: "/dinosaurs",
      result: Vinci.Fixtures.Dinosaur
    },
    show: %{
      method: :get,
      path: "/dinosaurs/:id",
      result: Vinci.Fixtures.Dinosaur
    },
  }
}
