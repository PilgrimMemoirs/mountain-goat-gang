defmodule MountainGoatGang.Trail do
  use MountainGoatGang.Web, :model

  schema "trails" do
    field :trailName, :string
    field :trailDescription, :string
    field :trailDistanceKm, :float
    field :trailDifficulty, :string
    field :trailElevationMeter, :float
    field :trailLat, :string
    field :trailLong, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:trailName, :trailDescription, :trailDistanceKm, :trailDifficulty, :trailElevationMeter, :trailLat, :trailLong])
    |> validate_required([:trailName, :trailDescription, :trailDistanceKm, :trailDifficulty, :trailElevationMeter, :trailLat, :trailLong])
  end
end
