function loadJsTree(){

	$('#jstreeTaxonomy')
		.jstree({
			"core" : {
				"animation" : 0,
				"check_callback" : true,
				'force_text' : true,
				"themes" : { "stripes" : true },
				'data' : {
					'url' : 'templates/json/newTaxonomy.json',
					// function (node) {
					//	return node.id === '#' ? 'templates/json/newTaxonomy.json' : 'templates/ajax_demo_children.json';
					//},
					'data' : function (node) {
						return { 'id' : node.id };
					}
				}
			},
			"plugins" : [ "contextmenu", "dnd" , "wholerow" ]
		});

}

function createRootNode() {
	$("#jstreeTaxonomy").jstree("create_node", null, "New Topic", "last", function (node) {
		console.log(node);
        this.edit(node);
    });
}

function hideOption(opt){
	$("#" + opt).css('display','none');
}

$(function () {

	$("#addTaxonomyBtn").click(function(){
		if($("#newTaxonomyName").val().length < 3){
			alertify.error('Please, type 3 letters at least!');
			return;
		}
		else{
			hideOption("editTaxonomyBox");
			var data = {
				operation : 1, // add taxonomy
				newTaxonomyName : $("#newTaxonomyName").val()
			}
			var request = $.ajax({
  								type: "POST",
  								url: "taxonomies-con.php",
  								data: data,
  								dataType: "json"
						  });
			request.done(function(result){
				if(result){
					$("#addTaxonomyBtn").css('display','none');
					$("#taxonomyId").val(result);
					$("#newTaxonomyName").attr('readonly','readonly');
					$("#container").css('display','block');
					alertify.success('Success! Taxonomy created!');
					loadJsTree();
				}
				else{
					alertify.error('An error has occurred! Please, contact the system administrator.');
				}
			});
		}
	});

	$("#editTaxonomyBtn").click(function(){
		if($("#editTaxonomyId").val() == -1){
			alertify.error('Please, select a taxonomy!');
			return;
		}
		else{
			hideOption("addTaxonomyBox");
			// codigo para buscar a taxonomia
		}
	});

	$("#saveTaxonomyBtn").click(function(){
		var data = {
				operation : 2, // add new taxonomy fields
				taxonomyId : $("#taxonomyId").val(),
				treeJson : $("#jstreeTaxonomy").jstree("get_json")
			}
		var request = $.ajax({
							type: "POST",
							url: "taxonomies-con.php",
							data: data,
							dataType: "json"
						  	});
		request.done(function(result){
			console.log(result);
		});
	});
});






/*
	var to = false;
	$('#demo_q').keyup(function () {
		if(to) { clearTimeout(to); }
		to = setTimeout(function () {
			var v = $('#demo_q').val();
			$('#jstree_demo').jstree(true).search(v);
		}, 250);
	});

	$('#jstree_demo')
		.jstree({
			"core" : {
				"animation" : 0,
				"check_callback" : true,
				'force_text' : true,
				"themes" : { "stripes" : true },
				'data' : {
					'url' : function (node) {
						return node.id === '#' ? 'templates/ajax_demo_roots.json' : 'templates/ajax_demo_children.json';
					},
					'data' : function (node) {
						return { 'id' : node.id };
					}
				}
			},
			/* "types" : {
				"#" : { "max_children" : 5, "max_depth" : 4, "valid_children" : ["root"] },
				"root" : { "valid_children" : ["default"] },
				"default" : { "valid_children" : ["default","file"] },
				"file" : { "valid_children" : [] }
			}, */
		//	"plugins" : [ "contextmenu", "dnd" , "wholerow" ]
		//});
