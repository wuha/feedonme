class Subscription < ActiveRecord::Base
	belongs_to :feed
	belongs_to :user
	
	def self.add(url,user)
	
		if url.instance_of?(Array)
			@subscription=Array.new
			url.each do |url|
				feed = Feedzirra::Feed.fetch_and_parse(url)
				if Feed.where("feedurl=?",url).exists?
					existing_feed= Feed.where("feedurl=?",url).first
					existing_feed.used_count+=1
					existing_feed.save
					existing_feed.subscriptions.create(user_id: user, unread_count: feed.entries.count)
					@subscription<<existing_feed
				else
					new_feed=Feed.create(name: feed.title, feedurl: url, used_count: 1)
					new_feed.subscriptions.create(user_id: user, unread_count: feed.entries.count)
					@subscription<<new_feed
				end
			end
		else
			feed = Feedzirra::Feed.fetch_and_parse(url)
			if Feed.where("feedurl=?",url).exists?
				existing_feed= Feed.where("feedurl=?",url).first
				existing_feed.used_count+=1
				existing_feed.save
				existing_feed.subscriptions.create(user_id: user, unread_count: feed.entries.count)
				@subscription=existing_feed
			else
				new_feed=Feed.create(name: feed.title, feedurl: url, used_count: 1, pageurl: feed.url)
				new_feed.subscriptions.create(user_id: user, unread_count: feed.entries.count)
				@subscription=new_feed
			end
		end
		
	@subscription	
	
	end
	
		
end
