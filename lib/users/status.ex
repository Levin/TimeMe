defmodule Users.Status do
  alias Ecto.Changeset
  use Ecto.Schema
  alias Timeme.Repo
  import Changeset

  def changeset(struct ,params) do
    struct
    |> cast(params, [:status_id, :title])
    |> validate_required([:status_id, :title])
  end

  schema "status" do
    field :status_id, :integer
    field :title, :string
  end

  def create_status(title) do
    case Repo.get_last_status() do
      {:ok, %Postgrex.Result{rows: id}} ->
        [value] = Enum.at(id, 0)
        Repo.insert_status(%Users.Status{status_id: value+1, title: title})
      {:error, res} -> IO.puts(res)
    end
  end


  def link_status_to_user(status, user_id) do

  end



end
