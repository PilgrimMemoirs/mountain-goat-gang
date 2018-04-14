defmodule MountainGoatGang.User do
  use Ecto.Schema

  schema "users" do
    field(:firstName, :string)
    field(:lastName, :string)
    many_to_many(:groups, MountainGoatGang.Group, join_through: "groups_users")
  end
end
