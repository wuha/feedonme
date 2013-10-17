class UnreadEntry < ActiveRecord::Base
	belongs_to :user
	belongs_to :feed
	belongs_to :entry
	
	def self.create_unread_entries
	
		User.all.each do |user|
			user.subscriptions.each do |subscription|
				entreis=Entry.where("feed_id=?",subscription.feed_id).each do |entry|				
					create(entry_id: entry.id, feed_id: subscription.feed_id, user_id: user.id)
				end
			end
		end		
	end
	
end
