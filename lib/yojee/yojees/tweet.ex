defmodule Yojee.Yojees.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :content, :string
    field :number_of_retweet, :integer

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:content, :number_of_retweet])
    |> validate_required([:content])
  end
end
