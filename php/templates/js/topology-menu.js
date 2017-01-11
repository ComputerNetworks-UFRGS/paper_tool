__LOG_RED = "#BB011F";
__LOG_GREEN = "green";
__LOG_BLUE = "blue";

__SELECTED = false;

__ADD_DEVICE = false;
__ADD_CONNECTION = false;
__DROP_ELEMENTS = false;
__MOVE_DEVICES = false;
__CAPTION_DEVICES = false;
__ZOOM_IN = false;
__ZOOM_OUT = false;
__PAN = false;
__CREATE_FROM_FILE = false;

__NEW_DEVICE_ID = false;
__SRC_DEVICE_ID = false;
__DST_DEVICE_ID = false;

$(window).load(function() {

	$( "#menu-draggable" ).draggable();

	$( ".close" ).click(function(){
		buttonControl(__SELECTED);
	});			

	$( "#btn-add-device" ).click(function(){
		$.post("topology-ajaxcon.php", $("#form-add-device").serialize() , function(r) {
			__NEW_DEVICE_ID = r;
			alertify.log("If you wanna connect the new device with another, click first in the device to connect. Otherwise, just click in the topology area.","",5000);
        	}).done(function (){
			
			});
	});

	$( "#btn-create-from-file" ).click(function(){
		$("#form-create-from-file > #_width").val($(" #topology-container ").width());
		$("#form-create-from-file > #_height").val( $(" #topology-container ").height());		
		alertify.log("Process started! Please, wait ...","",2000);
		$.post("topology-ajaxcon.php", $("#form-create-from-file").serialize() , function(r) {
			console.log(r);	
		}).done(function (){ 
			buttonControl(__SELECTED);
			makeTopology(ID_TOPOLOGY);
			alertify.log("OK! The topology has been drawn.","success",2000);
       	});
	});

	$( "li.li-menu > a" ).mousedown(function(){
        switch(this.id){
            case "zoom-in":{            
                buttonControl(this.id);
                break;
            }
            case "zoom-out":{
                buttonControl(this.id);
                break;
            }
        }
    });

	$( "li.li-menu > a" ).mouseup(function(){
		switch(this.id){
        	case "zoom-in":{		
				buttonControl(this.id);
				break;
			}
			case "zoom-out":{
                buttonControl(this.id);
                break;
            }
		}
    });

	$( "li.li-menu > a" ).click(function(){
		if(this.id != "zoom-in" && this.id != "zoom-out")
        	buttonControl(this.id);
    });

});

function buttonControl(eleID){
	
	alone = parseInt($( "#" + eleID ).attr("alone"));

 	if(alone){
   		controlMenuOption(eleID);
   	}
	else{
       if(!__SELECTED){
           __SELECTED = eleID;
           $( "#" + __SELECTED ).attr("class","a-menu-clicked");
           $( "li.li-menu > a" ).each(function (i,obj){
               alone = parseInt($( "#" + obj.id ).attr("alone"));
               console.log(alone);
               if(__SELECTED != obj.id && !alone)
                   $( "#" + obj.id ).attr("class","a-menu-disabled");
               });
           controlMenuOption(__SELECTED);
       }
       else {
           if(eleID == __SELECTED){
               controlMenuOption(__SELECTED);
               $( "li.li-menu > a" ).each(function (i,obj){
                   alone = parseInt($( "#" + obj.id ).attr("alone"));
                   if(!alone)
                       $( "#" + obj.id ).attr("class","a-menu");
               });
           __SELECTED = false;
           }
       }
   	}
}

function controlMenuOption(opt){

	switch(opt){
        case "add-device":{
            console.log("add-device");
			if(!__ADD_DEVICE){
				changeDevicesTheme("#E2E2E2");	
				$( "#menu-draggable" ).hide();
				__ADD_DEVICE = true;
			}
			else{
				changeDevicesTheme();	
				$( "#menu-draggable" ).show();
				__ADD_DEVICE = false;
			}
            break;
        }
		case "add-connection":{
            console.log("add-connection");
			if(!__ADD_CONNECTION){
				__ADD_CONNECTION = true;
                changeDevicesTheme("#E2E2E2");
				alertify.log("Add connection enabled. Click in the source device and destination device.","", 5000);
            }
            else{
                changeDevicesTheme();
                __ADD_CONNECTION = false;
            }
            break;
        }
        case "drop-elements":{
            console.log("drop-elements");
			if(!__DROP_ELEMENTS){
				__DROP_ELEMENTS = true;
				changeDevicesTheme("#E2E2E2");
				changeConnectionsTheme(__PAINT_STYLE.select);
                alertify.log("Drop elements enabled. Click on the element to drop.","", 5000);
			}
			else{
				changeDevicesTheme();
				changeConnectionsTheme(__PAINT_STYLE.normal);
				__DROP_ELEMENTS = false;
			}
            break;
        }
		case "edit-elements":{
            console.log("edit-elements");
            break;
        }
        case "move-devices":{
            console.log("move-devices");
			if(!__MOVE_DEVICES){
           		__MOVE_DEVICES = true;
            	enableDevicesToMove(__MOVE_DEVICES);
				alertify.log("Move devices: enabled!","", 2000);
            }
        	else{
				__MOVE_DEVICES = false;
            	enableDevicesToMove(__MOVE_DEVICES);
				alertify.log("Move devices: disabled!","", 2000);	
        		alertify.confirm("Do you want to save the changes?", function (e) {
    			if (e)
					updateDevicesPosition(true);
				else
					updateDevicesPosition(false);
    			});
			}
			break;
        }
		case "caption-devices":{
            console.log("caption-devices");
			if(!__CAPTION_DEVICES){
				changeDevicesCaption("ALIAS");
				$( "#" + opt ).attr("class","a-menu-clicked");
                __CAPTION_DEVICES = true;
            }
			else {
				changeDevicesCaption("IP");
				$( "#" + opt ).attr("class","a-menu");
				__CAPTION_DEVICES = false;
			}	
            break;
        }
		
        case "zoom-in":{
            console.log("zoom-in");
			if(!__ZOOM_IN){
				zoomToCenter(5);
				$( "#" + opt ).attr("class","a-menu-clicked");
				__ZOOM_IN = true;
			}
			else{
				$( "#" + opt ).attr("class","a-menu");
                __ZOOM_IN = false;
			}
			break;
        }
        case "zoom-out":{
            console.log("zoom-out");
			if(!__ZOOM_OUT){
                zoomToCenter(-5);
                $( "#" + opt ).attr("class","a-menu-clicked");
                __ZOOM_OUT = true;
            }
            else{
                $( "#" + opt ).attr("class","a-menu");
                __ZOOM_OUT = false;
            }
            break;
        }
        case "pan":{
            console.log("pan");
            if(!__PAN){
				TOPOLOGY_CONTAINER.draggable('enable');
                $( "#" + opt ).attr("class","a-menu-clicked");
                __PAN = true;
            }
            else {
				TOPOLOGY_CONTAINER.draggable('disable');
                $( "#" + opt ).attr("class","a-menu");
                __PAN = false;
            }
			break;
        }
		case "create-from-file":{
            console.log("create-from-file");
            if(!__CREATE_FROM_FILE){
                $( "#menu-draggable" ).hide();
                __CREATE_FROM_FILE = true;
            }
            else{
                $( "#menu-draggable" ).show();
                __CREATE_FROM_FILE = false;
            }
            break;
        }
    }	
}

function enableDevicesToMove(opt,deviceIdList){

    var c_dev = __TOPOLOGY_LIST.devices.length;
    var i,dev;

	if(typeof(deviceIdList) == "undefined"){
		console.log("Esta indefinido!");
	}

    for(i = 0; i < c_dev; i++){
        dev = __TOPOLOGY_LIST.devices[i];

		if(opt){
			jsPlumb.toggleDraggable(dev.id_box);
			$("#" + dev.id_shape).css("cursor", "move");
		}
		else{
			jsPlumb.toggleDraggable(dev.id_box);
			$("#" + dev.id_shape).css("cursor", "default");
		}
    }
	return true;
}
