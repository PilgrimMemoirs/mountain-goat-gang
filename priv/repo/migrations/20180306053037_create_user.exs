defmodule MountainGoatGang.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :firstName, :string
      add :lastName, :string
      add :email, :string

      timestamps()
    end

  end
end
