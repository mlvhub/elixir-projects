defmodule Geocr.ProvinceAgent do
  alias Geocr.Province

  @name = :province

  def start() do
    {:ok, json} = File.read "provincias.json"
    provinces = Poison.decode!(json, as: [Province])
    Agent.start_link(fn -> provinces end, name: @name)
    Agent.start_link(fn -> provinces end, name: @name)
  end

  def provinces() do
    {:ok, json} = File.read "provincias.json"
    Poison.decode!(json, as: [Province])
  end

end
