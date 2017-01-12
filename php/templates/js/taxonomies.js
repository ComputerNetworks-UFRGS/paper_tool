function demo_create() {
	//ref = $('#jstree_demo').jstree("create_node","#", {"type":"#"});
	/* var treeData = $('#jstree_demo').jstree(true).get_json('#', { 
					no_state : true,
					no_id : true,
					no_data: true,
					no_li_attr: true,
					no_a_attr: true
					});
	console.log(treeData); */
	$("#jstree_demo").jstree("create_node", null, null, "last", function (node) {
		console.log(node);
        this.edit(node);
    });

	/* var ref = $('#jstree_demo').jstree(true),
		sel = ref.get_selected();
	if(!sel.length) { 
		return false; 
	}
	sel = sel[0];
	sel = ref.create_node(sel, {"type":"file"});
	if(sel) {
		ref.edit(sel);
	} */
};
function demo_rename() {
	var ref = $('#jstree_demo').jstree(true),
		sel = ref.get_selected();
	if(!sel.length) { 
		return false; 
	}
	sel = sel[0];
	ref.edit(sel);
};
function demo_delete() {
	var ref = $('#jstree_demo').jstree(true),
		sel = ref.get_selected();
	if(!sel.length) { 
		return false; 
	}
	ref.delete_node(sel);
};

$(function () {
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
			"plugins" : [ "contextmenu", "dnd" , "wholerow" ]
		});
});
