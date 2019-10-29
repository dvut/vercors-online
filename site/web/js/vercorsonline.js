verification_error = function () {
	$('#verification-results').html('Failed to connect to the verification server!');
}

$('#verifythis').click(function () {
	$('#verification-results').text('Loading...');

	var data = {
		'Version': '1.0',
		'Language': $('input[name=language]').val(),
		'Source': $("textarea[name='examplecode']").val()
	};

	$.post('/site/verify', data, function (data, res) {
		if (data) {
			var result = jQuery.parseJSON(data);
			var verdict = result.Outputs[0].Value;
			$('#verification-results').html(verdict.replace(/\n/g, "<br />"));
		} else {
			verification_error();
		}
	}).fail(function () {
		verification_error();
	});
});