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
	for (var i = 0; i < positions; i++) {
		addLocation(positions[i]);
	}
//	addLocation(new google.maps.LatLng(46.688486, 2.422229));// France
//	addLocation(new google.maps.LatLng(43.010873, 12.551638));// Italy
//	addLocation(new google.maps.LatLng(-25.136856, 133.281323));// Australia
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