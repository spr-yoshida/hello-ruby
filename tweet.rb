require 'twitter'

consumerKey = ARGV[0]
consumerSecret = ARGV[1]
accessToken = ARGV[2]
accessSecret = ARGV[3]

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = consumerKey
  config.consumer_secret     = consumerSecret
  config.access_token        = accessToken
  config.access_token_secret = accessSecret
end

# Tweetする
#client.update("Ruby bot #自動")

