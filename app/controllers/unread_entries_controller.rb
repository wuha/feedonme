class UnreadEntriesController < ApplicationController
	before_filter :authenticate_user!
	
	def index			
		@unread_entries=Array.new		
		current_user.unread_entries.where("feed_id=?",params[:id]).order("date").reverse_order.each do |unread_entry|
			@unread_entries<<Entry.find(unread_entry.entry_id)
		end		
		respond_to do |format|
			format.js
		end	
	end
	
	def delete
		@entry_id=params[:id]
		current_user.unread_entries.where("entry_id=?",params[:id]).first.delete
		ReadEntry.create(entry_id: params[:id], user_id: current_user)
		respond_to do |format|
			format.js
		end	
	end


end
