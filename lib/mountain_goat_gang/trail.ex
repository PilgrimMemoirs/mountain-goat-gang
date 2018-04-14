defmodule MountainGoatGang.Trail do
  use Ecto.Schema

  schema "trails" do
    field(:name, :string)
    field(:location, :string)
    field(:description, :string)
    field(:level, :string)
    field(:latitude, :string)
    field(:longtitude, :string)
    many_to_many(:hikes, MountainGoatGang.Hike, join_through: "hikes_trails")
  end
end
