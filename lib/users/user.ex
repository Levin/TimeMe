defmodule Users.User do
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
  end

  def new_user(name, password, status) do
    %Users.Status{status_id: user_state} = Repo.get_status_by_title(status)
    IO.inspect(user_state)
    # TODO: error handling with case/cond -> case i guess, to catch :error case
    {:ok, %Postgrex.Result{rows: user_id_list}} = Repo.get_last_user()
    [user_id] = List.flatten(user_id_list)
    # link user and status in link status table
    Users.Userstatus.link_status_to_user(user_state, user_id)
    Repo.create_user(%Users.User{name: name, password_hashed: md5hash_password(password)})
  end


  def md5hash_password(password) do
    :crypto.hash(:md5, :erlang.term_to_binary(password)) |> Base.encode16

  end


end
