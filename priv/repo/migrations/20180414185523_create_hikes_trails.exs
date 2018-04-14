defmodule MountainGoatGang.Repo.Migrations.CreateHikesTrails do
  use Ecto.Migration

  def change do
    create table(:hikes_trails) do
      add(:trail_id, references(:trails))
      add(:hike_id, references(:hikes))
    end

    create(unique_index(:hikes_trails, [:trail_id, :hike_id]))
  end
end
