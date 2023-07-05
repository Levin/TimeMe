defmodule Users.User do
  use Ecto.Schema
  import Ecto.Changeset

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
    %Users.User{name: name, password_hashed: md5hash_password(password), status: link_status_to_user(status)}
  end


  defp md5hash_password(password) do
    :erlang.md5(password)
  end

  defp link_status_to_user(status_str) do
    status = Repo.get_status_number_from_string(status_str)

  end


end
