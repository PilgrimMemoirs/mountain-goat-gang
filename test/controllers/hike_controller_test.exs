defmodule MountainGoatGang.HikeControllerTest do
  use MountainGoatGang.ConnCase

  alias MountainGoatGang.Hike
  @valid_attrs %{complete: true, date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, description: "some content", hikeName: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hike_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = get conn, hike_path(conn, :show, hike)
    assert json_response(conn, 200)["data"] == %{"id" => hike.id,
      "hikeName" => hike.hikeName,
      "description" => hike.description,
      "date" => hike.date,
      "complete" => hike.complete}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hike_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, hike_path(conn, :create), hike: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Hike, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hike_path(conn, :create), hike: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = put conn, hike_path(conn, :update, hike), hike: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Hike, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = put conn, hike_path(conn, :update, hike), hike: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    hike = Repo.insert! %Hike{}
    conn = delete conn, hike_path(conn, :delete, hike)
    assert response(conn, 204)
    refute Repo.get(Hike, hike.id)
  end
end
