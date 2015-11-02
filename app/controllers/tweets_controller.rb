class TweetsController < ApplicationController
	def create
		twitter = TwitterObject.new(current_user)
		twitter.tweet(params[:tweet][:text])
		redirect_to root_path
	end

	def new
	end

	def update
		twitter = TwitterObject.new(current_user)
		tweet = twitter.find_tweet_by_id(params[:id])
		update_tweet(twitter, tweet, params[:format])
		
		redirect_to root_path
	end

	def update_tweet(twitter, tweet, action)
		if action == "favorite"
			twitter.favorite(tweet)
		elsif action == "unfavorite"
			twitter.unfavorite(tweet)
		elsif action == "retweet"
			twitter.retweet(tweet)
		else
			redirect_to root_path
		end
	end
end
