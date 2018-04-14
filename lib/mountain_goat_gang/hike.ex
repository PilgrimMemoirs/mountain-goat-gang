defmodule MountainGoatGang.Hike do
  use Ecto.Schema

  schema "hikes" do
    field(:name, :string)
    field(:description, :string)
    field(:status, :string)
    field(:level, :string)
    field(:date, :utc_datetime)
    field(:time, :time)
    field(:distanceM, :float)
    field(:meetUpLocation, :string)
    many_to_many(:trails, MountainGoatGang.Trail, join_through: "hikes_trails")
    many_to_many(:groups, MountainGoatGang.Group, join_through: "groups_hikes")
    many_to_many(:hikes, MountainGoatGang.Hike, join_through: "groups_hikes")
  end
end
