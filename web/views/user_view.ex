defmodule MountainGoatGang.UserView do
  use MountainGoatGang.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, MountainGoatGang.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, MountainGoatGang.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email}
  end
end
