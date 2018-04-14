defmodule MountainGoatGang.Group do
  use Ecto.Schema

  schema "groups" do
    field(:name, :string)
    field(:code, :string)
    field(:description, :string)
    many_to_many(:users, MountainGoatGang.User, join_through: "groups_users")
    many_to_many(:hikes, MountainGoatGang.Hike, join_through: "groups_hikes")
  end
end
