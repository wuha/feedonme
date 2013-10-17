class SubscriptionsController < ApplicationController
	before_filter :authenticate_user!
	include SubscriptionsHelper

	def new		  	
  	input_url=params[:url]
  	
  	if input_url.nil?
  		input_url=Array.new
  		input_url=params[:multi_url]
   	end
  
  	feed = Feedzirra::Feed.fetch_and_parse(input_url)
  	
		respond_to do |format|			
			if feed==0 or feed.nil?
				@feeds=discover_feeds(input_url)
				if @feeds.nil?	or @feeds.empty?		
					format.js {render 'no_subscriptions_found'}			
				else
					if @feeds.length==1
						@subscription=Subscription.add(@feeds.first[0],current_user.id)
						format.js 						
					else
						format.js {render 'list_of_discovered_subscriptions'}
					end
				end
			else
				@subscription=Subscription.add(input_url,current_user.id)
				format.js 	 
			end
		end 		
		
	end

	def self.list(user)
		@subscriptions=Array.new
	
		Subscription.where("user_id=?",user).each do |subscription|
			@subscriptions<<Feed.find(subscription.feed_id)
		end
		@subscriptions
	end

end
