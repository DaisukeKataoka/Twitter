class Tweet
	# プロパティの設定
	attr_accessor :contents, :count

	@@count = 0
	def initialize(contents)
		@contents = contents
		@@count += 1
	end
end
