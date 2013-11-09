class UnreadEntry < ActiveRecord::Base
	belongs_to :user
	belongs_to :feed
	belongs_to :entry
	
	def self.create_unread_entries
	
		User.all.each do |user|
			user.subscriptions.each do |subscription|
				Entry.where("feed_id=?",subscription.feed_id).each do |entry|	
					if UnreadEntry.where("entry_id=? and feed_id=? and user_id=?",entry.id,subscription.feed_id,user.id).first
					else
						if ReadEntry.where("entry_id=? and user_id=?",entry.id,user.id).first
						else
							create(entry_id: entry.id, feed_id: subscription.feed_id, user_id: user.id, date: entry.date )
						end
					end
				end
			end
		end		
	end
	
end
