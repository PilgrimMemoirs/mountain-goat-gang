defmodule MountainGoatGang.TrailView do
  use MountainGoatGang.Web, :view

  def render("index.json", %{trails: trails}) do
    %{data: render_many(trails, MountainGoatGang.TrailView, "trail.json")}
  end

  def render("show.json", %{trail: trail}) do
    %{data: render_one(trail, MountainGoatGang.TrailView, "trail.json")}
  end

  def render("trail.json", %{trail: trail}) do
    %{id: trail.id,
      trailName: trail.trailName,
      trailDescription: trail.trailDescription,
      trailDistanceKm: trail.trailDistanceKm,
      trailDifficulty: trail.trailDifficulty,
      trailElevationMeter: trail.trailElevationMeter,
      trailLat: trail.trailLat,
      trailLong: trail.trailLong}
  end
end
