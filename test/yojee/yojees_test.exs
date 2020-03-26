defmodule Yojee.YojeesTest do
  use Yojee.DataCase

  alias Yojee.Yojees

  describe "tweets" do
    alias Yojee.Yojees.Tweet

    @valid_attrs %{content: "some content", number_of_retweet: 42}
    @update_attrs %{content: "some updated content", number_of_retweet: 43}
    @invalid_attrs %{content: nil, number_of_retweet: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Yojees.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Yojees.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Yojees.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Yojees.create_tweet(@valid_attrs)
      assert tweet.content == "some content"
      assert tweet.number_of_retweet == 42
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Yojees.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{} = tweet} = Yojees.update_tweet(tweet, @update_attrs)
      assert tweet.content == "some updated content"
      assert tweet.number_of_retweet == 43
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Yojees.update_tweet(tweet, @invalid_attrs)
      assert tweet == Yojees.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Yojees.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Yojees.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Yojees.change_tweet(tweet)
    end
  end
end
