defmodule MountainGoatGang.TrailController do
  use MountainGoatGang.Web, :controller

  alias MountainGoatGang.Trail

  def index(conn, _params) do
    trails = Repo.all(Trail)
    render(conn, "index.json", trails: trails)
  end

  def create(conn, %{"trail" => trail_params}) do
    changeset = Trail.changeset(%Trail{}, trail_params)

    case Repo.insert(changeset) do
      {:ok, trail} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", trail_path(conn, :show, trail))
        |> render("show.json", trail: trail)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MountainGoatGang.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    trail = Repo.get!(Trail, id)
    render(conn, "show.json", trail: trail)
  end

  def update(conn, %{"id" => id, "trail" => trail_params}) do
    trail = Repo.get!(Trail, id)
    changeset = Trail.changeset(trail, trail_params)

    case Repo.update(changeset) do
      {:ok, trail} ->
        render(conn, "show.json", trail: trail)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(MountainGoatGang.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    trail = Repo.get!(Trail, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(trail)

    send_resp(conn, :no_content, "")
  end
end
