defmodule Tasks.Type do
  use Ecto.Schema
  import Ecto.Changeset
  alias Timeme.Repo

  schema "types" do
    field :type, :string
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:type])
    |> validate_required([:type])
  end

  def new_type(type) do
    Repo.insert_type(%Tasks.Type{type: type})
  end

  def get_type_by_title(type_title) do
    Repo.get_type_by_title(type_title)
  end

  def get_type_by_id(type_id) do
    Repo.get_type_by_id(type_id)
  end

  def remove_type(title) do
    Repo.remove_type(title)
  end

end
