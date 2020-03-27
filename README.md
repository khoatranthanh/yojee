# Yojee

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Version:
ReactJS: 16.13.1
Phoenix: 1.4.16

# How can you shape the architecture in a way that this solution scales with 1K, 1M, 1T tweets?
Now I just add 1 model is Tweet (content, number_of_retweet)
And I store by PostgreSQL, but I think when tweet number become huge, we should store some tweet (tweet show to user) in Memory cache (Redis).
And when we allow authorize via User login, I will create User table, 1 User has many Tweet, And for Re-tweet just store it as 1 Tweet with 1 more attribute tweet_id <- this is ID for original tweet.

I'm not familiary with Elixir/Phoenix (this is the first time I used it), please help me grop up with this!
