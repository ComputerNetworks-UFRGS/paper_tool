
function zoomToCenter(zf){

	_left = parseFloat( TOPOLOGY_CONTAINER.css("left") );
    _top = parseFloat( TOPOLOGY_CONTAINER.css("top") );

    _width = parseFloat(TOPOLOGY_CONTAINER.css("width"));
    _height = parseFloat(TOPOLOGY_CONTAINER.css("height"));

	if(zf < 0){
		zf = Math.abs(zf);
		_left+= (zf / 100) * _width;
		_top+= (zf / 100) * _height;
		_width-= ((zf / 100) * _width) * 2;
		_height-= ((zf / 100) * _height) * 2;
	}
	else{
		zf = Math.abs(zf);
        _left-= (zf / 100) * _width; 
        _top-= (zf / 100) * _height;
        _width+= ((zf / 100) * _width) * 2;
        _height+= ((zf / 100) * _height) * 2;
	}

	TOPOLOGY_CONTAINER.css("left", _left + "px");
	TOPOLOGY_CONTAINER.css("top", _top + "px");

	TOPOLOGY_CONTAINER.css("width", _width + "px");
    TOPOLOGY_CONTAINER.css("height", _height + "px");

	jsPlumb.repaintEverything();	
}
