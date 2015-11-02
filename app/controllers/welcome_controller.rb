class WelcomeController < ApplicationController
	def index
		if @user = current_user
			@twitter = TwitterObject.new(current_user)
			@tweets = @twitter.users_tweets
		end
	end
end
