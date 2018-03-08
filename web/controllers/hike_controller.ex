defmodule MountainGoatGang.HikeController do
  use MountainGoatGang.Web, :controller

  alias MountainGoatGang.Hike

  def index(conn, _params) do
    hikes = Repo.all(Hike)
    render(conn, "index.json", hikes: hikes)
  end

  def create(conn, %{"hike" => hike_params}) do
    changeset = Hike.changeset(%Hike{}, hike_params)

    case Repo.insert(changeset) do
      {:ok, hike} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", hike_path(conn, :show, hike))
        |> render("show.json", hike: hike)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MountainGoatGang.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hike = Repo.get!(Hike, id)
    render(conn, "show.json", hike: hike)
  end

  def update(conn, %{"id" => id, "hike" => hike_params}) do
    hike = Repo.get!(Hike, id)
    changeset = Hike.changeset(hike, hike_params)

    case Repo.update(changeset) do
      {:ok, hike} ->
        render(conn, "show.json", hike: hike)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MountainGoatGang.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hike = Repo.get!(Hike, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(hike)

    send_resp(conn, :no_content, "")
  end
end
