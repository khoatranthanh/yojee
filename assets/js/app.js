// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import 'bootstrap/dist/css/bootstrap.min.css'
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

import React from "react"
import ReactDOM from "react-dom"

import axios from 'axios';

class YojeeReact extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      tweets: [],
      content: ""
    }

    this.handleChange = this.handleChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleUpdate = this.handleUpdate.bind(this)
    this.fetchTweets = this.fetchTweets.bind(this)
  }

  handleUpdate(id, number_of_retweet) {
    axios.put('/api/tweets/' + id, {
      headers: {"Content-Type": "application/json"},
      tweet: {
        number_of_retweet: number_of_retweet + 1
      }
    })
    .then(response => {
      this.fetchTweets()
    })
    .catch(error => {
      Object.entries(error.response.data.errors).forEach(([key, value]) =>
        alert(key + " " + value[0])
      )
    });
  }

  handleChange(event) {
    this.setState({content: event.target.value});
  }

  handleSubmit() {
    axios.post('/api/tweets', {
      headers: {"Content-Type": "application/json"},
      tweet: {
        content: this.state.content,
        number_of_retweet: 0
      }
    })
    .then(response => {
      this.fetchTweets()
      this.state.content = ""
      alert("Tweet success!")
    })
    .catch(error => {
      Object.entries(error.response.data.errors).forEach(([key, value]) =>
        alert(key + " " + value[0])
      )
    });
  }

  fetchTweets() {
    axios.get("/api/tweets")
      .then(response => {
        this.setState({ tweets: response.data });
      })
      .catch(error => {
        console.log(error);
      });
  }

  componentDidMount() {
    this.fetchTweets()
  }

  render() {
    return <div className='container'>
      <h1>Tweets</h1>

      <form-group>
        <textarea onChange={this.handleChange} value={this.state.content} className='form-control'></textarea>
      </form-group>

      <button onClick={this.handleSubmit} className='btn btn-primary mt-3 mb-3'>Submit</button>

      {this.state.tweets.map(tweet => (
        <div key={tweet.id} className='jumbotron'>
          <h2>{tweet.content}</h2>
          <p>Re-tweeted: {tweet.number_of_retweet}</p>
          <button onClick={() => { this.handleUpdate(tweet.id, tweet.number_of_retweet) }} className='btn btn-primary'>Re-tweet</button>
        </div>
      ))}
    </div>
  }
}
ReactDOM.render(
  <YojeeReact/>,
  document.getElementById("yojee_test")
)
