$(document).ready(function() {

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
	
/*
		if(error){
			alertify.alert(message);
		}
		else{
			alertify.confirm("Do you confirm the filled data?",function(e){
				$( "form:first" ).submit();		
			});
		}	

	});
*/	
});

