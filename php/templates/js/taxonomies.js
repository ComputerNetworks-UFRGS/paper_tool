function loadJsTree(jsonData,treeId,plugins){
	console.log(jsonData);
	console.log(treeId);
	console.log(plugins);
	$('#' + treeId).jstree("destroy", true);
	jsTree = $('#' + treeId)
		.jstree({
			"core" : {
				"animation" : 0,
				"check_callback" : true,
				'force_text' : true,
				"themes" : { "stripes" : true },
				'data' : jsonData
			},
			"plugins" : plugins
		})
		.bind("loaded.jstree", function (event, data) {
            $(this).jstree("open_all");
        });
}

function createRootNode(treeId) {
	$('#' + treeId).jstree("create_node", null, "New Topic", "last", function (node) {
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
			hideOption("viewTaxonomyBox");
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
					$("#containerAddEditTaxonomy").css('display','block');
					alertify.success('Success! Taxonomy created!');
					template = [
								  { "id" : "topic_L1_1", "text" : "Topic 1", "type" : "root" },
								  { "id" : "topic_L1_2", "text" : "Topic 2", "type" : "root" },
								  { "id" : "topic_L1_3", "text" : "Topic 3", "type" : "root" },
								  { "id" : "topic_L1_4", "text" : "Topic 4", "type" : "root" }
							   ];
					loadJsTree(template,"jstreeTaxonomyAddEdit",[ "contextmenu", "dnd" , "wholerow" ]);
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
			$("#taxonomyId").val($("#editTaxonomyId").val());
			hideOption("addTaxonomyBox");
			var data = {
				operation : 3, // loading fields
				taxonomyId : $("#taxonomyId").val(),
			}
			var request = $.ajax({
							type: "POST",
							url: "taxonomies-con.php",
							data: data,
							dataType: "json"
						  	});
			request.done(function(result){
				if(result){
					$("#containerAddEditTaxonomy").css('display','block');
					loadJsTree(result,"jstreeTaxonomyAddEdit",[ "contextmenu", "dnd" , "wholerow" ]);
					alertify.success('Success! Fields loaded.');
				}
				else{
					alertify.error('An error has occurred! Please, contact the system administrator.');
				}
			});
		}
	});

	$("#viewTaxonomyBtn").click(function(){
		if($("#viewTaxonomyId").val() == -1){
			alertify.error('Please, select a taxonomy!');
			return;
		}
		else{
			$("#taxonomyId").val($("#viewTaxonomyId").val());
			hideOption("addTaxonomyBox");
			var data = {
				operation : 3, // loading fields
				taxonomyId : $("#taxonomyId").val(),
			}
			var request = $.ajax({
							type: "POST",
							url: "taxonomies-con.php",
							data: data,
							dataType: "json"
						  	});
			request.done(function(result){
				if(result){
					$("#containerViewTaxonomy").css('display','block');
					loadJsTree(result,"jstreeTaxonomyView",[ "dnd" , "wholerow" ]);
					alertify.success('Success! Fields loaded.');
				}
				else{
					alertify.error('An error has occurred! Please, contact the system administrator.');
				}
			});
		}
	});

	$("#saveTaxonomyBtn").click(function(){
		var data = {
				operation : 2, // add new taxonomy fields
				taxonomyId : $("#taxonomyId").val(),
				treeJson : $("#jstreeTaxonomyAddEdit").jstree("get_json")
			}
		var request = $.ajax({
							type: "POST",
							url: "taxonomies-con.php",
							data: data,
							dataType: "json"
						  	});
		request.done(function(result){
			if(result){
				alertify.success('Success! Fields recorded! Waiting the page reload.');
				setTimeout(function () { location.reload(1); }, 2000);
			}
			else{
				alertify.error('An error has occurred! Please, contact the system administrator.');
			}
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