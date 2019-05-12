
	$('#tab-2').on('click', function() {
		$('.product_img').toggleClass('hide_product'); 
		
		$('.tab-pane').removeClass('current'); 

		$(this).addClass('current');
		$('#' + tabId).addClass('current');
	});