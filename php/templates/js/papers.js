function loadJsTree(jsonData){
	$('#jstreeTaxonomy').jstree("destroy", true);
	jsTree = $('#jstreeTaxonomy')
		.jstree({
			"core" : {
				"animation" : 0,
				"check_callback" : true,
				'force_text' : true,
				"themes" : { "stripes" : true },
				'data' : jsonData
			},
			"checkbox": {
                "keep_selected_style": false
            },
			"plugins" : [ "checkbox", "dnd" , "wholerow" ]
		})
		.bind("loaded.jstree", function (event, data) {
            $(this).jstree("open_all");
        });
}

function formatOptions (option) {
  var ele = option.element[0];
  if (!option.id) { 
  	return option.text; 
  }
  return $('<span><div class="'+$(ele).data("status")+'" style="display: inline-table;"></div> ' + option.text + '</span>');
};

function changeSelect2Border(tdElement,borderColor,width){
	var div = $(tdElement).children('div').eq(0);
  	$(div).css('border','2px solid ' + borderColor);
  	$(div).css('width', width + 'px');
};

$(document).ready(function() {

	$('.selectsRating').select2({ formatResult: formatOptions });
	$('.selectsRating').on("change",function(event) {
		var paperId = $(this).data('paperid');
		var rating = $(this).val();
		var data = {
				"operation" : 10, // rating a paper
				"paperId" 	: paperId,
				"rating"	: rating

			};
		var request = $.ajax({
								type: "POST",
								url: "papers-con.php",
								data: data,
								dataType: "json"
					  });
		request.done(function(result){
			if(result){
				changeSelect2Border($("#colSelectsRatingID_"+ paperId),result);
				alertify.success('Success! Paper ID # '+paperId+' was rated!');
			}
			else{
				alertify.error('An error has occurred! Please, contact the system administrator.');
			}
		});
	});

	$('.selectsTaxonomies').select2({ formatResult: formatOptions });
	$('.selectsTaxonomies').on("change",function(event) {
		var paperId = $(this).data('paperid');
		var taxonomyId = $(this).val();
		if(taxonomyId == 0){
			return;
		}
		else{
			$('#modal-form-taxonomy').modal({show : true});
			var data = {
					operation  : 20, // load taxonomy fields and the selected ones
					paperId    : paperId,
					taxonomyId : taxonomyId
				};
			var request = $.ajax({
							type: "POST",
							url: "papers-con.php",
							data: data,
							dataType: "json"
						  	});
			request.done(function(result){
				if(result){
					$( "#modal_paperid" ).val(paperId);
					$( "#modal_taxonomyid" ).val(taxonomyId);
					loadJsTree(result);
				}
				else{
					alertify.error('An error has occurred! Please, contact the system administrator.');
				}
			});
		}
	});
	
	$('#btn-save-paper-taxonomy').click(function(){

		var paperId = $( "#modal_paperid" ).val();
		var taxonomyId = $( "#modal_taxonomyid" ).val();
        
        var data = {
				operation 	: 21, // save taxonomy for a paper
				paperId 	: paperId,
				taxonomyId 	: taxonomyId,
				treeJson 	: $("#jstreeTaxonomy").jstree("get_json")
			}
		var request = $.ajax({
							type: "POST",
							url: "papers-con.php",
							data: data,
							dataType: "json"
						  	});
		request.done(function(result){

			if(result){
				alertify.success('Success! Fields recorded! Waiting the page reload.');
				setTimeout(function () { location.reload(1); }, 1000);
			}
			else{
				alertify.error('An error has occurred! Please, contact the system administrator.');
			}
		});
    });

	$('select[name=DataTables_Table_0_length]').val(100).change();
	
	$('th[name=preview]').removeClass("sorting");
	$('th[name=preview]').removeAttr("aria-controls");		

	$('th[name=Viz]').removeClass("sorting");
    $('th[name=Viz]').removeAttr("aria-controls");

	$('th[name=Man]').removeClass("sorting");
    $('th[name=Man]').removeAttr("aria-controls");

    /*
	$('#save-paper').click(function(){
	
		$.post("papers-con.php", $("#taxonomy-id").serialize() , function(r) {
			console.log(r);
			if(r)
				alertify.success("OK! Taxonomy fields were saved!");
			else
				alertify.error("NOK! Some problem occurred. Please, try again.");
		});				

	});
	*/

	// add comment : operation 11
	$('#btn-add-comment').click(function(){

		var paperId = $( "#paper_id_comment" ).val();
        
        $.post("papers-con.php", $("#paper-add-comment").serialize() , function(r) {
			if(r){
				$("#comment").val();
                alertify.success("Success! Comments for the paper ID # "+ paperId +" was saved! ");
			}
            else
                alertify.error("An error has occurred! Please, contact the system administrator.");
        });
    });

	// load previous comments : operation 12
    $( "a.viewComments" ).click(function(){
		var paperId = $(this).data('paperid');

		var data = {
				"operation" : 12, // load previous comments
				"paperId" 	: paperId
			};
			var request = $.ajax({
  								type: "POST",
  								url: "papers-con.php",
  								data: data,
  								dataType: "json"
						  });
			request.done(function(result){
				if(result){
					var div = $("#previous-comments-body");
					$(div).empty();
					if(result == -1){
						$(div).append($('<h3>')
									  .css('color','#970000')
									  .css('width','100%')
									  .css('text-align','center')
									  .text('No previous comments!')
									 );
					}
					else{
						var ul = $('<ul>').addClass('chat-box').addClass('timeline');
						for(var i = 0; i < result.length; i++){
							var li = $('<li>')
									.addClass('gray')
									.append($('<div>')
											.addClass('info')
											.append($('<span>')
													.addClass('name')
													.append('<span class="label label-green">COMMENT</span>')
													.append('<strong class="indent"> '+result[i].user+' </strong> posted a comment')
												   )
											.append('<span class="time"><i class="icon-time"></i>'+result[i].time+'</span>')		 				   
											)
									.append('<div class="content"><blockquote>'+result[i].comment+'</blockquote></div>');
							$(ul).append($(li));
						}
						$(div).append($(ul));
					}
				}
				else{
					alertify.error('An error has occurred! Please, contact the system administrator.');
				}
			});
	});

    /*
	$('#withdraw-paper').click(function(){
       
		alertify.confirm("Are you sure? This action will remove this paper of the papers list. If you have some doubt regarding this action, please contact vtguimaraes@inf.ufrgs.br", function (e) {	
		if(e){
			document.getElementById("withdraw").submit();
		}
		});
  
    });
    */
	
	$( "tbody tr td.colSelectsRating " ).each(function( index ) {
  		var borderColor = $(this).data('selectbordercolor');
  		changeSelect2Border($(this),borderColor,100);
	});

	$( "tbody tr td.colSelectsTaxonomies " ).each(function( index ) {
  		var borderColor = $(this).data('selectbordercolor');
  		changeSelect2Border($(this),borderColor,180);
	});

	$( "a.addComment" ).click(function(){
		var paperId = $(this).data('paperid');
		$( "#paper_id_comment" ).val(paperId);
	});	

});

