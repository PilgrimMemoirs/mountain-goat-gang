defmodule MountainGoatGang.TrailControllerTest do
  use MountainGoatGang.ConnCase

  alias MountainGoatGang.Trail
  @valid_attrs %{description: "some content", latitude: "some content", level: "some content", location: "some content", longtitude: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, trail_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    trail = Repo.insert! %Trail{}
    conn = get conn, trail_path(conn, :show, trail)
    assert json_response(conn, 200)["data"] == %{"id" => trail.id,
      "name" => trail.name,
      "location" => trail.location,
      "description" => trail.description,
      "level" => trail.level,
      "latitude" => trail.latitude,
      "longtitude" => trail.longtitude}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, trail_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, trail_path(conn, :create), trail: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Trail, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, trail_path(conn, :create), trail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    trail = Repo.insert! %Trail{}
    conn = put conn, trail_path(conn, :update, trail), trail: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Trail, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    trail = Repo.insert! %Trail{}
    conn = put conn, trail_path(conn, :update, trail), trail: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    trail = Repo.insert! %Trail{}
    conn = delete conn, trail_path(conn, :delete, trail)
    assert response(conn, 204)
    refute Repo.get(Trail, trail.id)
  end
end
