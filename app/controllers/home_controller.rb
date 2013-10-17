class HomeController < ApplicationController
  def index
  	if user_signed_in?
	  	@current_user=current_user
	  	@user_subscriptions=SubscriptionsController.list(@current_user.id)
	  else
	  	render "not_signed_in"
	  end
  end
  
  def not_signed_in
  end

end
