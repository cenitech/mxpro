var home = home || {
	init: function() {
	    $(document).on('keypress', '[name=\'account\']', function(e) {
	    	if ($.inArray(e.which, [8,9,46]) != -1)
	    		return true;
	    	
	    	var accountText = $('[name=\'account\']').val();
	    	accountText += String.fromCharCode(e.which);
	    	
	    	if (!app.isValidEmailAddress(accountText + '@domain.com.br'))
	    		return false;
	    });
	    $(document).on('keypress', '[name=\'domain\']', function(e) {
	    	if ($.inArray(e.which, [8,9,46]) != -1)
	    		return true;
	    	
	    	var domainText = $('[name=\'domain\']').val();
	    	domainText += String.fromCharCode(e.which);
	    	
	    	if (!app.isValidEmailAddress('example@' + domainText + '.com.br'))
	    		return false;
	    });
	    $(document).on('keyup', '[name=\'account\']', function() {
	    	home.fillExample();
	    });
	    $(document).on('keyup', '[name=\'domain\']', function() {
	    	home.fillExample();
	    });
	},
	
	fillExample: function() {
		var accountText = $('[name=\'account\']').val();
		var domainText = $('[name=\'domain\']').val();
		
		if (accountText && domainText)
			$('.example').text(accountText + '@' + domainText + '.com.br');
		else if (domainText) {
			$('.example').text('contato@' + domainText + '.com.br');
		} else {
			$('.example').text('contato@minhaempresa.com.br');
		}
	}
};