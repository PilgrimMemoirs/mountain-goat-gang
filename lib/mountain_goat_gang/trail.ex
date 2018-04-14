defmodule MountainGoatGang.Trail do
  use Ecto.Schema

  schema "trails" do
    field(:name, :string)
    field(:location, :string)
    field(:description, :string)
    field(:level, :string)
    field(:latitude, :string)
    field(:longtitude, :string)
    belongs_to(:hike, MountainGoatGang.Hike)
  end
end
