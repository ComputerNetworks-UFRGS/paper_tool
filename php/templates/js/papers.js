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

$(document).ready(function() {

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
				$('#selectRating_ID_' + paperId).removeClass().addClass('selectsRating ' + result);
				alertify.success('Success! Paper ID # '+paperId+' was rated!');
			}
			else{
				alertify.error('An error has occurred! Please, contact the system administrator.');
			}
		});
	});

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

	$('.btnRemove').click(function(){
       
       	var paperId = $(this).data('paperid');
       	var year = $('#selectYear').val();
		alertify.confirm("Are you sure? This action will remove this paper of the papers list.", function (e) {	
			if(e){
				var data = {
					"operation" : 13, // remove paper
					"paperId" 	: paperId,
					"year"		: year
				};
				var request = $.ajax({
									type: "POST",
									url: "papers-con.php",
									data: data,
									dataType: "json"
						  		});
				request.done(function(result){
					console.log(result);
					if(result.error == 0){
						$('#trPaper_' + paperId).css('display','none');
						if(year == 0){
							$('.box-header').html('<h3>&nbsp;&nbsp;&nbsp;ALL - [' + result.total_papers_year + ' papers]</h3>');
						}
						else{
							$('.box-header').html('<h3>&nbsp;&nbsp;&nbsp;'+ year +' - [' + result.total_papers_year + ' papers]</h3>');
						}
						$('#totalPapers').html(result.total_papers);
						alertify.success('Success! Paper ID #' + paperId + ' was removed.');
					}
					else{
						alertify.error('An error has occurred! Please, contact the system administrator.');
					}
				});
			}
		});
  
    });

	$( "a.addComment" ).click(function(){
		var paperId = $(this).data('paperid');
		$( "#paper_id_comment" ).val(paperId);
	});	

	$('#selectUsers').on("change",function(event) {
		var userId = $(this).val();
		if($('.checkbox:checked').length == 0){
			alertify.error('Select one row at least, please.');
			return;
		}
		else if (userId == -1){
			alertify.error('Select an user, please.');
			return;
		}
		else{
			var data = {
					'operation'  : 14, // assign an user to paper(s)
					'userId'     : userId,
					'paperIds[]' : []
					};
			$('input[name="assignedPapers[]"]:checked').each(function() {
  				data['paperIds[]'].push($(this).val());
			});
			var request = $.ajax({
							type: "POST",
							url: "papers-con.php",
							data: data,
							dataType: "json"
						  	});
			request.done(function(result){
				if(result.error){
					var msg = 'Error to record the following papers: ';
					for(var i = 0; i < result.paperIds.length ; i++){
						msg+= result.paperIds[i] + ' |';
					}
					alertify.error(msg);
				}
				else{
					alertify.success('Success! Fields recorded! Waiting the page reload.');
					setTimeout(function () { location.reload(1); }, 1000);
				}
			});
		}
	});

	// START --- Select all checkboxes
	$("#selectAll").change(function(){  //"select all" change 
	    $(".checkbox").prop('checked', $(this).prop("checked")); //change all ".checkbox" checked status
	});

	$('.checkbox').change(function(){ 
	    if(false == $(this).prop("checked")){ //if this item is unchecked
	        $("#selectAll").prop('checked', false); //change "select all" checked status to false
	    }
	    if ($('.checkbox:checked').length == $('.checkbox').length ){
	        $("#selectAll").prop('checked', true);
	    }
	});
	// END ---- Select all checkboxes

});

