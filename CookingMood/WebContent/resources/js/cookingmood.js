jQuery(document).ready(function($) {
	$(document).ajaxSend(function(event, xhr, options) {
		var header = $("meta[name='_csrf_header']").attr("content");
		var token = $("meta[name='_csrf']").attr("content");
		xhr.setRequestHeader(header, token);
		$("div.loader").fadeIn();
	});
	$(document).ajaxComplete(function() {
		$("div.loader").fadeOut();
	});
});