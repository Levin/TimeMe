defmodule Timeme.Repo.Migrations.AddUser do
  use Ecto.Migration

  def change do
    create table "users" do
      add :name, :string
      add :password_hashed, :string
      add :status, :integer
    end
  end
end
