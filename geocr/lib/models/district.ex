defmodule Geocr.District do
  @derive [Poison.Encoder]

  defstruct [:id, :canton, :name]

end
