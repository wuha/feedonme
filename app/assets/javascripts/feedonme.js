$(document).ready(function() {
	$('#add_subscription_btn').click(function(){
		/*$('#add_subscription_btn').attr("disabled", true);
		$('#add_subscription_input').attr("disabled", true);*/
		$("#dashboard_action_notification").text("Looking for Feeds...");
		$('#add_subscription_btn').attr("disabled", true);
	});


});
