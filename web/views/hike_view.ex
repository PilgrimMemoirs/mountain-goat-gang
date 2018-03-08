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
      hikeName: hike.hikeName,
      description: hike.description,
      date: hike.date,
      complete: hike.complete}
  end
end
