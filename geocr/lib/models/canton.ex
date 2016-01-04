defmodule Geocr.Canton do
  @derive [Poison.Encoder]

  defstruct [:id, :province, :name, :population, :area]

end
