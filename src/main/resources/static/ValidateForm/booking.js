$().ready(function() {

	$("#regForm").validate({
		rules: {
			phone: {
				required: true,
				setNumInt: true,
			},
		},
		messages: {
			phone: {
				required: "Please enter phone number!!",
			},

		},

	});
	$('#phone-error').css('color', 'red');
});

jQuery.validator.addMethod("setNumInt", function(value, element) {
	return this.optional(element) || /^\d+$/.test(value);
}, "Only digits");
