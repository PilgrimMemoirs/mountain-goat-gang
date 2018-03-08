defmodule MountainGoatGang.Repo.Migrations.CreateTrail do
  use Ecto.Migration

  def change do
    create table(:trails) do
      add :trailName, :string
      add :trailDescription, :string
      add :trailDistanceKm, :float
      add :trailDifficulty, :string
      add :trailElevationMeter, :float
      add :trailLat, :string
      add :trailLong, :string

      timestamps()
    end

  end
end
