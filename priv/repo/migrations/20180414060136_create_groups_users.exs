defmodule MountainGoatGang.Repo.Migrations.CreateGroupsUsers do
  use Ecto.Migration

  def change do
    create table(:groups_users) do
      add(:user_id, references(:users))
      add(:group_id, references(:groups))
    end

    create(unique_index(:groups_users, [:user_id, :group_id]))
  end
end
