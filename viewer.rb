require 'rubygems'
require 'mongo'
require 'sinatra'

require './config'

configure do
  db = Mongo::Client.new(CONNECTION_STRING)
  TWEETS = db[COLLECTION_NAME]
end

get '/' do
  if params['tag']
    selector = {:tags => params['tag']}
  else
    selector = {}
  end

  #sampleが間違っている
  #@tweets = TWEETS.find(selector).sort(["id",-1])
  @tweets = TWEETS.find(selector).sort({"id" => -1})

  erb :tweets
end