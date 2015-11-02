require 'twitter'

class TwitterObject
	attr_accessor :client

	def initialize(user)
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_consumer_key"]
      config.consumer_secret     = ENV["twitter_consumer_secret"]
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def users_tweets
  	@client.home_timeline
  end

  def tweet(content)
  	@client.update(content)
  end

  def find_tweet_by_id(id)
  	@client.status(id)
  end

  def favorite(tweet)
  	@client.fav(tweet)
  end

  def unfavorite(tweet)
  	@client.unfavorite(tweet)
  end

  def retweet(tweet)
  	@client.retweet(tweet)
  end
end