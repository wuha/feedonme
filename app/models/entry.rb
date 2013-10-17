class Entry < ActiveRecord::Base
	belongs_to :feed
	has_many :unread_entries
	
	def self.fetch_feed_entries
		feeds=Feed.all
		feeds.each do |feed|
			current_feed=Feed.find(feed.id)
			feedzirra = Feedzirra::Feed.fetch_and_parse(feed.url)
			feedzirra.entries.each do |entry|
				if entry.title.nil?
				else
					unique_entriy_hash=Digest::MD5.hexdigest(entry.title+feed.id.to_s)
					
					if entry.published.nil?
						entry_date=Time.now.to_datetime
					else
						entry_date=entry.published
					end
				
					if entry.content
						current_feed.entries<<Entry.find_or_create_by_unique_entriy_hash(unique_entriy_hash,title: entry.title, content: entry.content, unique_entriy_hash: unique_entriy_hash, date: entry_date)
					else
						current_feed.entries<<Entry.find_or_create_by_unique_entriy_hash(unique_entriy_hash,title: entry.title, content: entry.summary, unique_entriy_hash: unique_entriy_hash, date: entry_date)
					end
				end
			end		
		end		
	end
	
	
end
