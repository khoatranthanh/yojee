defmodule YojeeWeb.TweetController do
  use YojeeWeb, :controller

  alias Yojee.Yojees
  alias Yojee.Yojees.Tweet

  action_fallback YojeeWeb.FallbackController

  def index(conn, _params) do
    tweets = Yojees.list_tweets()
    render(conn, "index.json", tweets: tweets)
  end

  def create(conn, %{"tweet" => tweet_params}) do
    with {:ok, %Tweet{} = tweet} <- Yojees.create_tweet(tweet_params) do
      conn
      |> put_status(:ok)
      |> render("show.json", tweet: tweet)
    end
  end

  def update(conn, %{"id" => id, "tweet" => tweet_params}) do
    tweet = Yojees.get_tweet!(id)

    with {:ok, %Tweet{} = tweet} <- Yojees.update_tweet(tweet, tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end
end
