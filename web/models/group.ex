defmodule MountainGoatGang.Group do
  use MountainGoatGang.Web, :model

  schema "groups" do
    field :groupName, :string
    field :groupDescription, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:groupName, :groupDescription])
    |> validate_required([:groupName, :groupDescription])
  end
end
