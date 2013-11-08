class Feed < ActiveRecord::Base
	has_many :subscriptions
	has_many :entries
	has_many :unread_entries
	has_many :read_entries
	
	
end
