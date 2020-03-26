defmodule Yojee.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :content, :string
      add :number_of_retweet, :integer

      timestamps()
    end

  end
end
