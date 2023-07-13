defmodule Users.Userstatus do
  alias Ecto.Changeset
  use Ecto.Schema
  import Changeset
  alias Timeme.Repo

  def changeset(struct, params) do
    struct
    |> cast(params, [:user_id, :status_id])
    |> validate_required([:user_status, :status_id])
  end

  schema "link_user_status" do
    field :user_id, :integer
    field :status_id, :integer
  end

  def link_status_to_user(status, user_id) do
    Repo.link_user_status(%Users.Userstatus{user_id: user_id, status_id: status})
  end


end
