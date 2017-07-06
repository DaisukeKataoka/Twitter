class TweetsController < ApplicationController
	def search
		client = Twitter::REST::Client.new do |config|
			# 事前準備で取得したキーのセット
			config.consumer_key				 = Rails.application.secrets.twitter_consumer_key
			config.consumer_secret		= Rails.application.secrets.twitter_consumer_secret
		end
		@count = 0
		@tweets = []
		since_id = nil
		# 検索ワードが存在していたらツイートを取得
		if params[:keyword].present?
			# リツイートを除く、検索ワードにひっかかった最新100件のツイートを取得する
			tweets = client.search(params[:keyword], count: 100, result_type: "recent", exclude: "retweets", since_id: since_id)
			# 取得したツイートをモデルに渡す
			tweets.take(100).each do |tw|
				tweet = Tweet.new(tw.full_text)
				@tweets << tweet
			end
			@count = @tweets.length
		end
		respond_to do |format|
			format.html #show.html.erb
		end
	end
end
