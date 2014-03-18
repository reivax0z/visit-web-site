/**
 * 
 */

//Global variables
var map;
var marker;

function initializeMapPosition(position, zoomVal) {
	// Init the map
	var myOptions = {
			zoom: zoomVal,
			center: position,
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map(document.getElementById('map_position'), myOptions);
	addLocation(position);
}

function initializeMapCountries(positions, zoomVal) {
	// Init the map
	var myOptions = {
			zoom: zoomVal,
			center: positions[0],
			mapTypeId: google.maps.MapTypeId.ROADMAP
	};

	map = new google.maps.Map(document.getElementById('map_countries'), myOptions);
	
	// delegate it with a parameter containing all the positions
	for (var i = 0; i < positions.length; i++) {
		addLocation(positions[i]);
	}
}

function addLocation(pos){
	// Get coordinates
	var options = {
			position: pos
	};
	marker = new google.maps.Marker(options);

	// Show marker on map
	marker.setMap(map);
	bounce();
}

function bounce() {
	// Is the marker already animating?
	if (marker.getAnimation()) {
		marker.setAnimation(null);
	} else {
		// Make it bounce!
		marker.setAnimation(google.maps.Animation.BOUNCE);
	}
}