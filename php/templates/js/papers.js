function formatOptions (option) {
  var ele = option.element[0];
  if (!option.id) { 
  	return option.text; 
  }
  return $('<span><div class="'+$(ele).data("status")+'" style="display: inline-table;"></div> ' + option.text + '</span>');
};

function changeSelect2Border(tdElement,borderColor){
	var div = $(tdElement).children('div').eq(0);
  	$(div).css('border','2px solid ' + borderColor);
};

$(document).ready(function() {

	$('.selectsRating').select2({ formatResult: formatOptions });
	$('.selectsRating').on("change",function(event) {
		var paperId = $(this).data('paper');
		var rating = $(this).val();
		var data = {
				"operation" : 10, // rating a paper
				"paperId" 	: paperId,
				"rating"	: rating

			}
			var request = $.ajax({
  								type: "POST",
  								url: "papers-con.php",
  								data: data,
  								dataType: "json"
						  });
			request.done(function(result){
				if(result){
					console.log(result);
					changeSelect2Border($("#colSelectsRatingID_"+ paperId),result);
					alertify.success('Success! Paper ID # '+paperId+' was rated!');
				}
				else{
					alertify.error('An error has occurred! Please, contact the system administrator.');
				}
			});
	});

	$('.selectsTaxonomies').select2({ formatResult: formatOptions });
	
	$('select[name=DataTables_Table_0_length]').val(100).change();
	
	$('th[name=preview]').removeClass("sorting");
	$('th[name=preview]').removeAttr("aria-controls");		

	$('th[name=Viz]').removeClass("sorting");
    $('th[name=Viz]').removeAttr("aria-controls");

	$('th[name=Man]').removeClass("sorting");
    $('th[name=Man]').removeAttr("aria-controls");

	$('#save-paper').click(function(){
	
		$.post("papers-con.php", $("#taxonomy-id").serialize() , function(r) {
			console.log(r);
			if(r)
				alertify.success("OK! Taxonomy fields were saved!");
			else
				alertify.error("NOK! Some problem occurred. Please, try again.");
		});				

	});

	$('#btn-add-comment').click(function(){

        $.post("papers-con.php", $("#paper-add-comment").serialize() , function(r) {
			if(r){
                alertify.success("OK! The comment was saved! Wait, the page will be reloaded in 5 seconds to refresh comments ...");
				setInterval(function(){location.reload();},5000);
			}
            else
                alertify.error("NOK! Some problem occurred. Please, try again.");
        });

    });

	$('#withdraw-paper').click(function(){
       
		alertify.confirm("Are you sure? This action will remove this paper of the papers list. If you have some doubt regarding this action, please contact vtguimaraes@inf.ufrgs.br", function (e) {	
		if(e){
			document.getElementById("withdraw").submit();
		}
		});
  
    });
	

	$( "tbody tr td.colSelectsRating " ).each(function( index ) {
  		var borderColor = $(this).data('selectbordercolor');
  		changeSelect2Border($(this),borderColor);
	});

});

