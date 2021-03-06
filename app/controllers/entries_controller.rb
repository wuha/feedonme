class EntriesController < ApplicationController
	before_filter :authenticate_user!
	def index		
		@entries=Feed.find(params[:id]).entries
		respond_to do |format|
			format.js
		end	
	end
	
	def show
		@entry=Entry.find(params[:id])
		@feedname=Feed.where("id=?",@entry.feed_id).first.name
		respond_to do |format|
			format.js
			format.html
		end	
	
	end

end
