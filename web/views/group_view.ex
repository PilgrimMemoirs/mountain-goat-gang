defmodule MountainGoatGang.GroupView do
  use MountainGoatGang.Web, :view

  def render("index.json", %{groups: groups}) do
    %{data: render_many(groups, MountainGoatGang.GroupView, "group.json")}
  end

  def render("show.json", %{group: group}) do
    %{data: render_one(group, MountainGoatGang.GroupView, "group.json")}
  end

  def render("group.json", %{group: group}) do
    %{id: group.id,
      groupName: group.groupName,
      groupDescription: group.groupDescription}
  end
end
