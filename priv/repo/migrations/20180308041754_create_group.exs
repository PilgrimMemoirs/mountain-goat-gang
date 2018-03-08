defmodule MountainGoatGang.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :groupName, :string
      add :groupDescription, :string

      timestamps()
    end

  end
end
