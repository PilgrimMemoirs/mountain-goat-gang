defmodule MountainGoatGang.TrailTest do
  use MountainGoatGang.ModelCase

  alias MountainGoatGang.Trail

  @valid_attrs %{trailDescription: "some content", trailDifficulty: "some content", trailDistanceKm: "120.5", trailElevationMeter: "120.5", trailLat: "some content", trailLong: "some content", trailName: "some content"}
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
