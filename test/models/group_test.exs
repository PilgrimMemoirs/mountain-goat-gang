defmodule MountainGoatGang.GroupTest do
  use MountainGoatGang.ModelCase

  alias MountainGoatGang.Group

  @valid_attrs %{code: "some content", description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Group.changeset(%Group{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Group.changeset(%Group{}, @invalid_attrs)
    refute changeset.valid?
  end
end
