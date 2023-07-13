defmodule Users.User do
  alias Users.Status
  use Ecto.Schema
  import Ecto.Changeset
  alias Timeme.Repo

  def changeset(struct, params) do
    struct
    |> cast(params, [:name, :password_hashed, :status])
    |> validate_required([:name, :password_hashed, :status])

  end

  schema "users" do
    field :name, :string
    field :password_hashed, :string
    field :status, :integer
  end

  def new_user(name, password, status) do
    %Users.Status{status_id: user_state} = Repo.get_status_by_title(status)
    IO.inspect(user_state)
    case Repo.get_last_user() do
      {:ok, %Postgrex.Result{rows: user_id}} ->
        case user_id do
          x -> Users.Status.link_status_to_user(user_state, x+1)
          true -> Users.Status.link_status_to_user(user_state, 1)
          IO.inspect(user_id)
        end
    end
    Repo.create_user(%Users.User{name: name, password_hashed: md5hash_password(password), status: user_state})
  end


  def md5hash_password(password) do
    :crypto.hash(:md5, :erlang.term_to_binary(password)) |> Base.encode16

  end


end
