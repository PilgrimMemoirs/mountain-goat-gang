defmodule MountainGoatGang.Hike do
  use MountainGoatGang.Web, :model

  schema "hikes" do
    field :hikeName, :string
    field :description, :string
    field :date, Ecto.DateTime
    field :complete, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:hikeName, :description, :date, :complete])
    |> validate_required([:hikeName, :description, :date, :complete])
  end
end
