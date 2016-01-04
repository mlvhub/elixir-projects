defmodule Geocr do
  alias Geocr.Province
  alias Geocr.Canton
  alias Geocr.District

  def cantons() do
    {:ok, json} = File.read "cantones.json"
    Poison.decode!(json, as: [Canton])
  end

  def districts() do
    {:ok, json} = File.read "distritos.json"
    Poison.decode!(json, as: [District])
  end

  def province_by_canton(%Canton{province: provinceId}) do
    provinces
    |> Enum.filter fn province -> province.id == provinceId end
  end

  def cantons_by_province(%Province{id: id}) do
    cantons
    |> Enum.filter fn canton -> canton.province == id end
  end

end
