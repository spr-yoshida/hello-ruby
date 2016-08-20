require 'rubygems'
require 'mongo'
require 'twitter'

require './config'

class TweetArchiver

  # Create a instance of TweetArchiver
  def initialize(tag)
    db = Mongo::Client.new(CONNECTION_STRING)
    @tweets = db[COLLECTION_NAME]

    # create index

    @tag = tag
    @tweets_found = 0
  end

  def update
    puts "Starting Twitter search for '#{@tag}'..."
    save_tweets_for(@tag)
    print "#{@tweets_found} tweets saved.¥n¥n"
  end

  private

  def save_tweets_for(term)

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = CONSUMER_KEY
      config.consumer_secret     = CONSUMER_SECRET
      config.access_token        = ACCESS_TOKEN
      config.access_token_secret = ACCESS_TOKEN_SECRET
    end

    client.search(term).each do |tweet|
      @tweets_found += 1
      tweet_with_tag = tweet.to_hash.merge!({"tags" => [term]})
      @tweets.insert_one(tweet_with_tag)
    end
  end

end