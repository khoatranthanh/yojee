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
      |> put_status(:created)
      |> put_resp_header("location", Routes.tweet_path(conn, :show, tweet))
      |> render("show.json", tweet: tweet)
    end
  end
end
