defmodule MountainGoatGang.Repo.Migrations.CreateHike do
  use Ecto.Migration

  def change do
    create table(:hikes) do
      add :hikeName, :string
      add :description, :string
      add :date, :utc_datetime 
      add :complete, :boolean, default: false, null: false

      timestamps()
    end

  end
end
