defmodule YojeeWeb.TweetView do
  use YojeeWeb, :view
  alias YojeeWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    render_many(tweets, TweetView, "tweet.json")
  end

  def render("show.json", %{tweet: tweet}) do
    render_one(tweet, TweetView, "tweet.json")
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{id: tweet.id,
      content: tweet.content,
      number_of_retweet: tweet.number_of_retweet}
  end
end
