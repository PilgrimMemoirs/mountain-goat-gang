defmodule MountainGoatGang.Repo.Migrations.CreateGroupsHikes do
  use Ecto.Migration

  def change do
    create table(:groups_hikes) do
      add(:hike_id, references(:hikes))
      add(:group_id, references(:groups))
    end

    create(unique_index(:groups_hikes, [:hike_id, :group_id]))
  end
end
