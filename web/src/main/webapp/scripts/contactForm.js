$(document).ready(function(){
    $('form[data-async]').on('submit', function(event) {
	var $form = $(this);
	var $target = $($form.attr('data-target'));
	$('#cPass').hide();

	var opts = {
	    lines: 10, // The number of lines to draw
	    length: 12, // The length of each line
	    width: 1, // The line thickness
	    radius: 1, // The radius of the inner circle
	    corners: 1, // Corner roundness (0..1)
	    rotate: 0, // The rotation offset
	    direction: 1, // 1: clockwise, -1: counterclockwise
	    color: '#E96125', // #rgb or #rrggbb or array of colors
	    speed: 1, // Rounds per second
	    trail: 60, // Afterglow percentage
	    shadow: false, // Whether to render a shadow
	    hwaccel: false, // Whether to use hardware acceleration
	    className: 'spinner', // The CSS class to assign to the spinner
	    zIndex: 2e9, // The z-index (defaults to 2000000000)
	    top: '50%', // Top position relative to parent
	    left: '50%' // Left position relative to parent
	};
	
	$('#contactResponse').append('<div id="wheel-append"></div>');
	// prevent form collapse
	$('#contactResponse').append('<div class="row top-buffer form-padding"></div>');
	$('#contactResponse').append('<div class="row top-buffer form-padding"></div>');
	$('#contactResponse').append('<div class="row top-buffer form-padding"></div>');
	
	var target = document.getElementById('wheel-append');
	var spinner = new Spinner(opts).spin(target);
	
	$.ajax({
	    type: $form.attr('method'),
	    url: $form.attr('action'),
	    data: $form.serialize(),

	    success: function(data, status) {
		$(".form-padding").remove();
		$('.spinner').remove();
		$('#child-append-data').remove();
		$('#contactResponse').append('<div id="child-append-data" class="alert alert-success top-buffer text-center" style="font-size: 150%;" >' + JSON.parse(data).message + '</div>')
		setTimeout( '$("#contactModal").modal("hide");$("#cPass").show();$("#child-append-data").remove();',3000 );
	    }
	});
	
	event.preventDefault();
	
    });
});
