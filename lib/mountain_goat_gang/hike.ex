defmodule MountainGoatGang.Hike do
  use Ecto.Schema

  schema "hikes" do
    field(:name, :string)
    field(:description, :string)
    field(:status, :string)
    field(:level, :string)
    field(:date, :naive_datetime)
    field(:time, :time)
    field(:distanceM, :float)
    field(:meetUpLocation, :string)
    has_one(:trail, MountainGoatGang.Trail)

    many_to_many(:groups, MountainGoatGang.Group, join_through: "groups_hikes")
    many_to_many(:hikes, MountainGoatGang.Hike, join_through: "groups_hikes")
  end
end
