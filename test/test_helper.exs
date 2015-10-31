Code.require_file "./support/fixtures.exs", __DIR__
Code.require_file "./support/fixtures_http.exs", __DIR__
ExUnit.start()

apisaurus_config = %{
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

Vinci.ConfigAgent.start_link
Vinci.ConfigAgent.add_config(:apisaurus, apisaurus_config)
