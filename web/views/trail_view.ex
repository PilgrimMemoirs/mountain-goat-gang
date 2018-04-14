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
      name: trail.name,
      location: trail.location,
      description: trail.description,
      level: trail.level,
      latitude: trail.latitude,
      longtitude: trail.longtitude}
  end
end
