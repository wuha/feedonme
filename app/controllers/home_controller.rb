class HomeController < ApplicationController
  def index
  	if user_signed_in?
	  	@current_user=current_user
	  	@user_subscription_all_unread_count=0
	  	@user_subscriptions=SubscriptionsController.list(@current_user)
	  	
	  	@user_subscriptions.each do |subscription|
	  		@user_subscription_all_unread_count+=subscription[:unread]
	  	end
	  	
	  else
	  	render "not_signed_in"
	  end
  end
  
  def not_signed_in
  end

end
