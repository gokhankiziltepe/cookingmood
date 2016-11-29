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
	function getParameterByName(name, url) {
		if (!url) {
			url = window.location.href;
		}
		name = name.replace(/[\[\]]/g, "\\$&");
		var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex.exec(url);
		if (!results)
			return null;
		if (!results[2])
			return '';
		return decodeURIComponent(results[2].replace(/\+/g, " "));
	}
	var cookingmood = {
		_privateMember : 3,
		publicMember : "A string",
		init : function UN_init() {
			this.doSomething(this.anotherMember);
		},
		doSomething : function UN_doSomething(aParam) {
			alert(aParam);
		}
	};
});
var cookingmood = cookingmood || {};
cookingmood.util = (function() {
	return {
		getParameterByName : function(name, url) {
			if (!url) {
				url = window.location.href;
			}
			name = name.replace(/[\[\]]/g, "\\$&");
			var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"), results = regex.exec(url);
			if (!results)
				return null;
			if (!results[2])
				return '';
			return decodeURIComponent(results[2].replace(/\+/g, " "));
		},
	};
}());
