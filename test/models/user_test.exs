defmodule MountainGoatGang.UserTest do
  use MountainGoatGang.ModelCase

  alias MountainGoatGang.User

  @valid_attrs %{firstName: "some content", lastName: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
