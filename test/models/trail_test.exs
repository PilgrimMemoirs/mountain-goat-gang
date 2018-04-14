defmodule MountainGoatGang.TrailTest do
  use MountainGoatGang.ModelCase

  alias MountainGoatGang.Trail

  @valid_attrs %{description: "some content", latitude: "some content", level: "some content", location: "some content", longtitude: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Trail.changeset(%Trail{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Trail.changeset(%Trail{}, @invalid_attrs)
    refute changeset.valid?
  end
end
