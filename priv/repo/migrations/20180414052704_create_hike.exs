defmodule MountainGoatGang.Repo.Migrations.CreateHike do
  use Ecto.Migration

  def change do
    create table(:hikes) do
      add(:name, :string)
      add(:description, :string)
      add(:status, :string)
      add(:level, :string)
      add(:date, :utc_datetime)
      add(:time, :time)
      add(:distanceM, :float)
      add(:meetUpLocation, :string)

      timestamps()
    end
  end
end
