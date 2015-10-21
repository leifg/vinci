defmodule Vinci.Fixtures do
  defmodule Dinosaur do
    defstruct [:id, :name, :length, :weight, :diet, :description]
  end

  def new_dinosaur do
    %Dinosaur{
      name: "Saurornitholestes sullivani",
      length: 1.8,
      weight: 10.0,
      diet: "carnivorous",
    }
  end

  def created_dinosaur do
    max_id = dinosaurs |> Enum.map(fn(d) -> Map.get(d, :id) end) |> Enum.max
    Map.put(new_dinosaur, :id, max_id + 1)
  end

  def dinosaur_by_id(id) do
    dinosaurs |> Enum.find(fn(d) -> Map.fetch!(d, :id) |> Integer.to_string == id end)
  end

  def dinosaurs do
    [
      %Dinosaur{
        id: 1,
        name: "Megalosaurus bucklandii",
        length: 9.0,
        weight: -1,
        diet: "carnivorous",
        description: "Megalosaurus was one of the first dinosaurs discovered."
      },
    ]
  end
end
