defmodule MountainGoatGang.HikeTest do
  use MountainGoatGang.ModelCase

  alias MountainGoatGang.Hike

  @valid_attrs %{date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, description: "some content", distanceM: "120.5", level: "some content", meetUpLocation: "some content", name: "some content", status: "some content", time: %{hour: 14, min: 0, sec: 0}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hike.changeset(%Hike{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hike.changeset(%Hike{}, @invalid_attrs)
    refute changeset.valid?
  end
end
