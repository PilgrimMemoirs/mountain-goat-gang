defmodule MountainGoatGang.Repo.Migrations.CreateGroup do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :code, :string
      add :description, :string

      timestamps()
    end

  end
end
