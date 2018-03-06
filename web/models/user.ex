defmodule MountainGoatGang.User do
  use MountainGoatGang.Web, :model

  schema "users" do
    field :firstName, :string
    field :lastName, :string
    field :email, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:firstName, :lastName, :email])
    |> validate_required([:firstName, :lastName, :email])
  end
end
