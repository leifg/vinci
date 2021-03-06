defmodule VinciTest do
  use ExUnit.Case
  import Vinci.Fixtures
  doctest Vinci

  test "Vinci returns correct data for INDEX" do
    assert Vinci.call(:apisaurus, :all, %{}, %{}) == { :ok, dinosaurs }
  end

  test "Vinci returns correct data for CREATE" do
    assert Vinci.call(:apisaurus, :create, new_dinosaur, %{}) == { :ok, created_dinosaur }
  end

  test "Vinco returns correct data for SHOW" do
    assert Vinci.call(:apisaurus, :show, %{id: 1}, %{}) == { :ok, dinosaur_by_id("1") }
  end
end
