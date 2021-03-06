// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require bootstrap
//= require bootstrap-editable
//= require jquery.maskedinput.min
//= require selectize.min
//= require jquery.autocomplete.min
//= require moip-2.7.0.min
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

var app = app || {
	init: function() {
	    
	},
	
	editable: function() {
		$('.editable').editable({
			send: 'always',
			emptytext: 'nulo'
		});
	},
	
	checkuncheck: function(master, slave) {
		$(document).on('click', master, function() {
			var checked = $(master).prop('checked');
			$(slave).prop('checked', checked);
		});
	},
	
	showwhenchecked: function(master, slave, control) {
		$(document).on('click', master, function() {
			var checked = $(master + ':checked').not(control).length > 0;
			$(slave).toggleClass('hidden', !checked);
		});
	},
	

	isValidEmailAddress : function(emailAddress) {
		var pattern = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return pattern.test(emailAddress);
	},
	
	applyAddressData : function(data) {
		$('input[name=\'street\']').val(data.street);
		$('input[name=\'city\']').val(data.city);
		$('select[name=\'region\']').val(data.region);
		
		if (data.street) {
			$('input[name=\'number\']').focus();
		} else {
			$('input[name=\'street\']').focus();
		}
	},

	setMinHeight : function() {
		$('.base').css('min-height', $(document).height()-70);
	},
	
	urlRedirect : function(data) {
		if (data.url) {
			window.location.replace(data.url);
		} else {
			$('#modal').html(data);
		}
	},
	
	hash : function() {
		var cc = new Moip.CreditCard({
			number : $('input[name=\'cardnumber\']').val().replace(/\s/g, ''),
			cvc : $('input[name=\'security\']').val(),
			expMonth : $('input[name=\'expiration\']').val().substring(0,2),
			expYear : $('input[name=\'expiration\']').val().substring(5,7),
			pubKey : $('input[name=\'pubkey\']').val()
		});
		if (cc.isValid()) {
			var brand = Moip.Validator.cardType(cc.number).brand;
			
			$('input[name=\'brand\']').val(brand);
			$('input[name=\'creditCardHash\']').val(cc.hash());
		} else {
			$('input[name=\'creditCardHash\']').val('');
			return false; // Don't submit the form
		}
	},
	
	showCreditCardBrand : function() {
		$('#cc-brand').removeClass();
		
		var cardnumber = $('input[name=\'cardnumber\']').val().replace(/\s/g, '');
		var cc = Moip.Validator.cardType(cardnumber);
		
		if (cc) {
			$('#cc-brand').addClass('cc-' + cc.brand.toLowerCase() + '-picture');
		}
	}
};