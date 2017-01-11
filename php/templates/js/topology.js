// jsPlumb line style

__PAINT_STYLE = 
	{
	"normal" : { strokeStyle : "#003FE0" , lineWidth : "2" , dashstyle  : "solid" } ,
	"select" : { strokeStyle : "#E2E2E2" , lineWidth : "2" , dashstyle  : "solid" },	
	"hoverNormal" : { strokeStyle: "orange" , lineWidth: "2" },
	"hoverSelect" : { strokeStyle: "red" , lineWidth: "2" }
	};

__TOPOLOGY_LIST = new Array();
__SVG_PATH__ = null;
__END_POINT_OPTIONS = null;

ID_TOPOLOGY = null;
TOPOLOGY_MAIN = null;
TOPOLOGY_CONTAINER = null;

$(document).ready(function() {

	TOPOLOGY_MAIN = $( "#topology-main" );

	TOPOLOGY_CONTAINER = $( "#topology-container" );

	TOPOLOGY_CONTAINER.css("width",TOPOLOGY_MAIN.css("width"));
	TOPOLOGY_CONTAINER.css("height",TOPOLOGY_MAIN.css("height"));

	jsPlumb.importDefaults({
        DragOptions : { cursor: "pointer", zIndex:2000 },
        Container: "topology-container",
        MaxConnections : 100,
        RenderMode: 'canvas',
    });	

});

$(window).load(function() {

	__SVG_PATH__ = $( "#SVG_PATH" ).val();
    ID_TOPOLOGY  = parseInt($( "#ID_TOPOLOGY" ).val());

	__END_POINT_OPTIONS = {
//      anchor:"Center", 
      isSource:true, 
      isTarget:true,
      connector : "Straight",
//      connectorStyle: { lineWidth:2, strokeStyle:'red' },
//	  paintStyle: __PAINT_STYLE.normal ,
//      scope:"blueline",
      dragAllowedWhenFull:true 
	}; 

	TOPOLOGY_CONTAINER.click(function(e){
		console.log("cliquei na topologia!");
		topologyClick(e);
		return false;
	});

	TOPOLOGY_CONTAINER.draggable();
	TOPOLOGY_CONTAINER.draggable('disable');

	makeTopology(ID_TOPOLOGY);

});

function makeTopology(id){

	$.post("topology-ajaxcon.php", { "id_topology" : id , "operation" : "getTopologyList" } , function (result) {
        __TOPOLOGY_LIST = jQuery.parseJSON(result);
    }).done(function (){
        drawTopology();
        $( ".device-shape" ).click(function(){
            deviceClick(this);
            return false;
            });
/*
		$('#topology-main').bind('mousewheel', function(e, delta, deltaX, deltaY) {
        
		var xScreen = e.pageX - $(this).offset().left;
        var yScreen = e.pageY - $(this).offset().top;
	
		c_dev = __TOPOLOGY_LIST.devices.length;
    	var i;

    	for(i = 0; i < c_dev; i++){

//			zoomf = 1 - (delta / 100);

//			console.log(zoomf);

			w = parseInt($("#"+__TOPOLOGY_LIST.devices[i].id_box).css("width"));
			h = parseInt($("#"+__TOPOLOGY_LIST.devices[i].id_box).css("height"));

			x = parseInt($("#"+__TOPOLOGY_LIST.devices[i].id_box).css("left"));
			y = parseInt($("#"+__TOPOLOGY_LIST.devices[i].id_box).css("top"));

			__X_IMAGE = __X_IMAGE + ((xScreen - x) / __SCALE);
        	__Y_IMAGE = __Y_IMAGE + ((yScreen - y) / __SCALE);

			if (delta > 0){
            	__SCALE *= 2;
        	}
        	else{
            	__SCALE /= 2;
        	}
        
			__SCALE = __SCALE < 1 ? 1 : (__SCALE > 64 ? 64 : __SCALE);

			var xNew = (xScreen - __X_IMAGE) / __SCALE;
        	var yNew = (yScreen - __Y_IMAGE) / __SCALE;

			$("#"+__TOPOLOGY_LIST.devices[i].id_box).css('-moz-transform', 'scale(' + __SCALE + ')' + 'translate(' + xNew + 'px, ' + yNew + 'px' + ')');
			$("#"+__TOPOLOGY_LIST.devices[i].id_box).css('-moz-transform-origin', __X_IMAGE + 'px ' + __Y_IMAGE + 'px');

/*
			x =  (w/2) + ((x - (w/2)) / zoomf);
			y =  (h/2) + ((y - (h/2)) / zoomf);
	
			w =  w / zoomf;
			h =  h / zoomf;
	
			//console.log(x,y,w,h);

			$("#"+__TOPOLOGY_LIST.devices[i].id_box).css("width",w);
			$("#"+__TOPOLOGY_LIST.devices[i].id_box).css("height",h);
			$("#"+__TOPOLOGY_LIST.devices[i].id_box).css("left",x);
			$("#"+__TOPOLOGY_LIST.devices[i].id_box).css("top",y)

			jsPlumb.animate($("#"+__TOPOLOGY_LIST.devices[i].id_box),{
            
                    "left": '+='+x,
        			"top" : '+='+y,
                  });

    	}

    	});
*/
        });

}

function topologyClick(e){
	switch(__SELECTED){
        case "add-device":{

    		$.post("topology-ajaxcon.php", { "deviceId" : __NEW_DEVICE_ID , "operation" : "getDeviceSize" }  ,
        		function (r) {
					d_size = jQuery.parseJSON(r);

					coordx = e.clientX - ((d_size[0].width / 100 * parseFloat(TOPOLOGY_CONTAINER.css("width"))) / 2);
					coordy = e.clientY - ((d_size[0].height / 100 * parseFloat(TOPOLOGY_CONTAINER.css("height"))) / 2);				

					var device = new Array();	
	
					aux = { "id" : __NEW_DEVICE_ID  ,
                			"coordx" : coordx,
               				"coordy" : coordy};
        			device.push(aux);

					$.post("topology-ajaxcon.php", {"id_topology" : ID_TOPOLOGY ,
                                    				"operation" : "updateDevicesPosition" ,
                                    				"devices" : JSON.stringify(device) } ,
    				function (result) {
    		
					}).done(function (){ 
						__NEW_DEVICE_ID = false;
						buttonControl(__SELECTED);	
						makeTopology(ID_TOPOLOGY);
						alertify.log("Sucess - New device added!","success",1000);
					});
				});
            break;
        }
    }
}

function deviceClick(ele){
	switch(__SELECTED){
        case "add-device":{

			changeDevicesTheme("#007CDD",ele.id);

			from = __NEW_DEVICE_ID;
			to = $(" #" + ele.id).attr("data-dbid");

			$.post("topology-ajaxcon.php", { "from" : from , "to" : to , "operation" : "addConnection" } , function (r) {
				r = parseInt(r);
            	if(r == 1)
					alertify.log("OK - Destination device selected!","success",2000);
				else
					alertify.log("Ops! Connection already exists!","error",2000);
			});

			break;
        }
		case "add-connection":{

			changeDevicesTheme("#007CDD",ele.id);		

			console.log(__SRC_DEVICE_ID + " ==== " + __DST_DEVICE_ID);

			if(!__SRC_DEVICE_ID){
				__SRC_DEVICE_ID = $(" #" + ele.id).attr("data-dbid");		
				alertify.log("OK - Source device selected!","success",2000);	
			}	
			else if (!__DST_DEVICE_ID){
				__DST_DEVICE_ID = $(" #" + ele.id).attr("data-dbid");
		
				$.post("topology-ajaxcon.php", { "from" : __SRC_DEVICE_ID , "to" : __DST_DEVICE_ID , "operation" : "addConnection" }  ,
            	function (r) {
					r = parseInt(r);
                	if(!r){
						__DST_DEVICE_ID = false;
						changeDevicesTheme("#E2E2E2",ele.id);
						alertify.log("Ops! Connection already exists!","error",2000);
					}
					else{
						buttonControl(__SELECTED);
                    	makeTopology(ID_TOPOLOGY);
                    	alertify.log("Sucess - New connection added!","success",2000);
						__SRC_DEVICE_ID = false;
                		__DST_DEVICE_ID = false;
					}
						
            	});
			}
			break;
		}
		case "drop-elements":{
			alertify.confirm("Do you really want to drop this device? REMEMBER: all connections for this device will be lost.",function(e){
                if (e){
					deviceId = $(" #" + ele.id).attr("data-dbid");
					$.post("topology-ajaxcon.php", { "deviceId" : deviceId , "operation" : "dropDevice" }  ,
                	function (r) {
                    	r = parseInt(r);
                    	if(r){
                        	makeTopology(ID_TOPOLOGY);
                       	 	alertify.log("Success - Device was dropped!","success",2000);
                    	}
					}).done(function (){
					});
				}
			});
			break;
		}
	}
}

function connectionClick(conn){
	var srcDev = conn.sourceId.split("_")[2];
	var dstDev = conn.targetId.split("_")[2];

	switch(__SELECTED){
        case "drop-elements":{
			alertify.confirm("Do you really want to drop this connection?", function (e) {
                if (e){
					$.post("topology-ajaxcon.php", { "from" : srcDev , "to" : dstDev , "operation" : "dropConnection" } , function (r) {
                		r = parseInt(r);
                		if(r == 1){
                    		alertify.log("OK - Connection droped!","success",2000);
							makeTopology(ID_TOPOLOGY);
							}
                		else
                    		alertify.log("Ops! An error ocurred ...","error",2000);
            		});		
				}
           	});				
			break;
		}	
	}
}

function drawTopology(){

	TOPOLOGY_CONTAINER.empty();

	var c_dev = __TOPOLOGY_LIST.devices.length;
	var c_con = __TOPOLOGY_LIST.connections.length;
	var i;

	for(i = 0; i < c_dev; i++){
		__TOPOLOGY_LIST.devices[i] = drawDevice(__TOPOLOGY_LIST.devices[i]);
		jsPlumb.draggable($("#" + __TOPOLOGY_LIST.devices[i].id_box));
		jsPlumb.toggleDraggable(__TOPOLOGY_LIST.devices[i].id_box);
	}

	console.log(__TOPOLOGY_LIST.connections[0]);

	for(i = 0; i < c_con; i++){
        __TOPOLOGY_LIST.connections[i] = drawConnection(__TOPOLOGY_LIST.connections[i]);
    }
}

function getDeviceEndPoint(__id) {
	
	var c_dev = __TOPOLOGY_LIST.devices.length;

	for(i = 0; i < c_dev; i++){
    	if(__id == __TOPOLOGY_LIST.devices[i].id)
			return __TOPOLOGY_LIST.devices[i].endPoint;
	}	
	
	return false;
}

function drawDevice(__device) {
	
	var box,shape,alias,style;

	__device.id_box = "id_box_" + __device.id;
	__device.id_shape = "id_shape_" + __device.id;
	__device.id_alias = "id_alias_" + __device.id;

	_x = __device.coordx / parseFloat(TOPOLOGY_CONTAINER.css("width")) * 100;
	_y = __device.coordy / parseFloat(TOPOLOGY_CONTAINER.css("height")) * 100;

	_width = __device.width;
	_height = __device.height;

	box = $(document.createElement('div'));
	style = "left:"+_x+"%;"+"top:"+_y+"%;height:"+_height+"%;width:"+_width+"%;"; 
	$(box).attr({ "class" : "device-box", "id" : __device.id_box , "style" : style });
	
	shape = $(document.createElement('div'));
	$(shape).attr({ "class" : "device-shape", "id" : __device.id_shape , "data-dbid" : __device.id });
	$(shape).load(__SVG_PATH__ + __device.icon);	

	alias = $(document.createElement('p'));
	$(alias).attr({ "class" : "device-alias" , "id" : __device.id_alias });
	$(alias).text(__device.ipaddress);

	$(box).append(shape);
	$(box).append(alias);

	TOPOLOGY_CONTAINER.append(box);

	__device.endPoint = jsPlumb.addEndpoint(__device.id_box, { anchor:"Center", endpoint:[ "Dot", {radius:2} ] }, __END_POINT_OPTIONS);

	return __device;

}

function drawConnection(__connection) {

	var con = 	jsPlumb.connect({
              		source: getDeviceEndPoint(__connection.device_from),
            		target: getDeviceEndPoint(__connection.device_to),
					hoverPaintStyle: __PAINT_STYLE.hoverNormal ,
					paintStyle: eval('(' + __connection.style + ')') ,
/*
					overlays: [
                		[ "Label", {
                    		cssClass:"connection-label component",
                    		label: __connection.device_from + "|" + __connection.device_to,
                    		location:0.5,
                    		id: (__connection.device_from + "|" + __connection.device_to)

                			} ] 
            			]
*/
				});

	con.bind("click", function(conn) {
   		connectionClick(conn);
		return false;
		//conn.setPaintStyle({ strokeStyle:"blue", lineWidth:10 });
	});

/*
	var con = jsPlumb.connect({
            source: $('#id_box_' + __connection.device_from),
            target: $('#id_box_' + __connection.device_to),
            anchor: "Center",
            connector: "Straight",
            endpoint:[ "Dot", { radius:1 } ],
            paintStyle: { strokeStyle:"#FF0000", lineWidth:2 },
            hoverPaintStyle:{ strokeStyle:"blue", lineWidth:2 }
            overlays: [
                [ "Label", {
                    cssClass:"connection-label component",
                    label: labelDescription,
                    location:0.5,
                    id: (source.iface + "|" + target.iface)

                } ] 
            ]
        });
*/
	__connection.jsPlumbCon = con;
	return __connection;
}

function updateDevicesPosition(opt){

	var c_dev = __TOPOLOGY_LIST.devices.length;
    var i,coordx,coordy,aux;
	var devices = new Array();

	if(!opt){
		drawTopology();
		return;
	}

    for(i = 0; i < c_dev; i++){
		__TOPOLOGY_LIST.devices[i].coordx = parseInt($("#" + __TOPOLOGY_LIST.devices[i].id_box).css("left"));
		__TOPOLOGY_LIST.devices[i].coordy = parseInt($("#" + __TOPOLOGY_LIST.devices[i].id_box).css("top"));
		aux = { "id" : __TOPOLOGY_LIST.devices[i].id  , 
				"coordx" : __TOPOLOGY_LIST.devices[i].coordx, 
				"coordy" : __TOPOLOGY_LIST.devices[i].coordy};
		devices.push(aux);
    }

	//console.log(JSON.stringify(devices));

	$.post("topology-ajaxcon.php", {"id_topology" : ID_TOPOLOGY , 
									"operation" : "updateDevicesPosition" , 
									"devices" : JSON.stringify(devices) } , 
	function (result) {
		console.log(result);	
	}).done(function (){ alertify.log("Saved!","success",1000); });	

}

function changeDevicesCaption(opt) {

	var c_dev = __TOPOLOGY_LIST.devices.length;
    
	for(i = 0; i < c_dev; i++){
		$("#" + __TOPOLOGY_LIST.devices[i].id_alias).empty();
        console.log($("#" + __TOPOLOGY_LIST.devices[i].id_alias));
		if(opt == "IP")
			$("#" + __TOPOLOGY_LIST.devices[i].id_alias).text(__TOPOLOGY_LIST.devices[i].ipaddress);
		else	
			$("#" + __TOPOLOGY_LIST.devices[i].id_alias).text(__TOPOLOGY_LIST.devices[i].alias);
    }
}

function changeDevicesTheme(color,device){

	if(typeof(color)==='undefined') color = "";
    if(typeof(device)==='undefined') device = false;

	if(device){
		$('#'+device).find('.svgNormal').css("fill",color);
	}
	else
		$(".svgNormal").css("fill",color);
}

function changeConnectionsTheme(pStyle){

	var c_con = __TOPOLOGY_LIST.connections.length;

	for(i = 0; i < c_con; i++){
    	conn = __TOPOLOGY_LIST.connections[i].jsPlumbCon;
		conn.setPaintStyle(pStyle);	
    }
}


/*





	var firstInstance = jsPlumb.getInstance();

	jsPlumb.importDefaults({
		DragOptions : { cursor: "pointer", zIndex:2000 },
		Container: "topology-main",
		MaxConnections : 100,
		RenderMode: 'canvas',
	});

	var connection = jsPlumb.connect({
			source: $('#device_sh1'),
			target: $('#device_sh2'),
			anchor: "Center",
			connector: "Straight",
			endpoint:[ "Dot", { radius:1 } ],
			paintStyle: { strokeStyle:"#FF0000", lineWidth:2 },
			hoverPaintStyle:{ strokeStyle:"blue", lineWidth:2 }
			
			overlays: [
				[ "Label", {
					cssClass:"connection-label component",
					label: labelDescription,
					location:0.5,
					id: (source.iface + "|" + target.iface)

				} ]	
			]
			
		});	

	jsPlumb.draggable(jsPlumb.getSelector("#device_1"));
	jsPlumb.draggable(jsPlumb.getSelector("#device_2"));	

	$("#device_1").css("z-index",1);
	$("#device_2").css("z-index",1);

	$( "#menu-draggable" ).draggable();
	//$( ".device-box" ).draggable();	

	$( ".device-shape" ).load(__SVG_PATH__+"host.svg", function () {
	});

	$('#clean').click(function(){
		$( ".device-shape" ).empty();
	});

	$('#zoom-plus').click(function(){
		connection.setPaintStyle({ strokeStyle:"#FF00FF", lineWidth: 10 });
/*
		_width = parseInt($( ".device-box" ).css("width"));
		_height = parseInt($( ".device-box" ).css("height"));

		for(i = 1; i <= 3; i++){
			_left = parseInt($( "#device_" + i ).css("left"));
			_top = parseInt($( "#device_" + i ).css("top"));
			$( "#device_" + i ).css("left",_left - 10);
			$( "#device_" + i ).css("top",_top - 10);
		}

		_prop = parseFloat(_width / _height); 

		_height+= 10; 
		_width = _height * _prop; 


		$( ".device-box" ).css("width",_width)
		$( ".device-box" ).css("height",_height);
		
*/		
	



/*
	$( "#topology-main" ).click(function (e){
		var x = e.pageX - this.offsetLeft;
		var y = e.pageY - this.offsetTop;
		
		var dd = $("<div>");

		dd.addClass("router");
		dd.appendTo(this);

		h = dd.height();
		w = dd.width();

		var x = (e.pageX - this.offsetLeft) - parseInt(w / 2);
        var y = (e.pageY - this.offsetTop) - parseInt(h / 2);

		dd.attr({'style': "left: " + x + "px; top: " + y + "px;"});

		dd.draggable();

		return;
	});	
*/	
