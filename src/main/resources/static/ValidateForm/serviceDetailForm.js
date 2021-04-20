$().ready(function() {

	$("#serviceDetailForm").validate({
		rules: {
			title: {
				required: true,
			},
			description: {
				required: true,
			},
			content: {
				required: true,
			},
			timeToComplete: {
				required: true,
			},
			price: {
				required: true,
			},
			sale: {
				required: true,
				range: [0, 100],
			},
			primaryImage: {
				required: true,
			},
			extraImage: {
				required: true,
			},
		},
		messages: {
			title: {
				required: "Title not empty",
			},
			description: {
				required: "Description not empty",
			},
			content: {
				required: "Content not empty",
			},
			timeToComplete: {
				required: "Time to complete not empty",
			},
			price: {
				required: "Price not empty",
			},
			sale: {
				required: "Sale not empty and [0% - 100%]",
			},
			primaryImage: {
				required: "MainImage not empty",
			},
			extraImage: {
				required: "ImageDetail not empty",
			},
		},

	});
	$('#title-error, #description-error, #content-error, #timeToComplete-error, #price-error, #sale-error, #primaryImage-error, #extraImage-error').css('color', 'red');
});

jQuery.validator.addMethod("setWordAndDigit", function(value, element) {
	return this.optional(element) || /^[\w\s\d_.-]+$/.test(value);
}, "only word and digits");
