defmodule MountainGoatGang.Repo.Migrations.CreateTrailBelongsToHike do
  use Ecto.Migration

  def change do
  	alter table(:trails) do
  		add :trail_id, references(:hikes)

  	end
  end
end
