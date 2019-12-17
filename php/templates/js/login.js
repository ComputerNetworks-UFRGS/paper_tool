$(document).ready(function() {
	
	$("#btn").click(function() {
		$('#formulario').submit();
	});

	$("#pass").keydown(function (e) {
        if (e.keyCode == 13)
			$('#formulario').submit();
    });	

});
