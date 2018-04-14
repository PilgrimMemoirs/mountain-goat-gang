defmodule MountainGoatGang.Repo.Migrations.CreateTrail do
  use Ecto.Migration

  def change do
    create table(:trails) do
      add :name, :string
      add :location, :string
      add :description, :string
      add :level, :string
      add :latitude, :string
      add :longtitude, :string

      timestamps()
    end

  end
end
