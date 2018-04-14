defmodule MountainGoatGang.HikeView do
  use MountainGoatGang.Web, :view

  def render("index.json", %{hikes: hikes}) do
    %{data: render_many(hikes, MountainGoatGang.HikeView, "hike.json")}
  end

  def render("show.json", %{hike: hike}) do
    %{data: render_one(hike, MountainGoatGang.HikeView, "hike.json")}
  end

  def render("hike.json", %{hike: hike}) do
    %{id: hike.id,
      name: hike.name,
      description: hike.description,
      status: hike.status,
      level: hike.level,
      date: hike.date,
      time: hike.time,
      distanceM: hike.distanceM,
      meetUpLocation: hike.meetUpLocation}
  end
end
