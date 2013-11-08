var opts = {
  lines: 9, // The number of lines to draw
  length: 6, // The length of each line
  width: 3, // The line thickness
  radius: 4, // The radius of the inner circle
  corners: 1, // Corner roundness (0..1)
  rotate: 0, // The rotation offset
  direction: 1, // 1: clockwise, -1: counterclockwise
  color: '#000', // #rgb or #rrggbb or array of colors
  speed: 1, // Rounds per second
  trail: 60, // Afterglow percentage
  shadow: false, // Whether to render a shadow
  hwaccel: false, // Whether to use hardware acceleration
  className: 'spinner', // The CSS class to assign to the spinner
  zIndex: 2e9, // The z-index (defaults to 2000000000)
  top: 'auto', // Top position relative to parent in px
  left: 'auto' // Left position relative to parent in px
};



$(document).ready(function() {
	$('#new_subscriptions_sumbit_btn').hide();

	$( "html" ).click(function(event) {

		if(!$(event.target).is('#add_subscription_input'))
		{
			$('#new_subscriptions_sumbit_btn').fadeOut();
			
		}else{
			
	    $('#new_subscriptions_sumbit_btn').fadeIn();
		};

	});	
	
	$( "#new_subscriptions_sumbit_btn" ).click(function(event) {
		
		var target = document.getElementById('dashboard_action_spinner');
		var spinner = new Spinner(opts).spin(target);

	});	
	
	$( "#dashboard_subscription_list li" ).click(function(event) {
		
		
		$('#dashboard_subscription_list li').removeClass('subscription_selected');
		$(this).addClass('subscription_selected').removeClass('subscription_unselected');
		

	});
	
	
	$('#dashboard_entries_list').on('click','li',function(event) {

		
		$('#dashboard_entries ul li').removeClass('entry_selected');
		$(this).addClass('entry_selected').removeClass('entry_unselected');
		//alert($(this).html());

});		
	
		
});

















