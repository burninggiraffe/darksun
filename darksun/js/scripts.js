class Location {
	constructor (title,x,y,content,label) {
		this.title = title;
		this.x = 2400-y;
		this.y = x;
		this.content = content;
		this.label = label;
	}
}
		
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
	if (this.readyState == 4 && this.status == 200) {
		xmlDoc = xhttp.responseXML;
		var list = new Array();
		
		var info = xmlDoc.getElementsByTagName('landmark');
		for (i = 0; i < info.length; i++) {
			var title = info[i].getAttribute('title');
			var xpos = info[i].getAttribute('xposition');
			var ypos = info[i].getAttribute('yposition');
			var content = info[i].getAttribute('fulltext');
			var label = info[i].getAttribute('label');

			var location = new Location(title,xpos,ypos,content,label);
			list.push(location);
		}
		
		var bounds = [[0,0], [2400,1832]];
		var map = L.map('map', {crs: L.CRS.Simple, zoomControl: false, attributionControl: false, maxBounds: bounds});
		var image = L.imageOverlay('images/athas_map.jpg', bounds).addTo(map);
		map.fitBounds(bounds);
		map.touchZoom.disable();
		map.doubleClickZoom.disable();
		map.scrollWheelZoom.disable();
		
		var placeIcon = L.icon({
			iconUrl: 'images/marker.png',
			iconSize: [33, 33],
			iconAnchor: [16, 16]
		});
		
		for (i = 0; i < list.length; i++) {
			var labelIcon = L.divIcon({className:'marker-icon',html:'<div class="marker-icon"><b>'+list[i].title+'</b></div>'});
			if (list[i].label == 'bottom') {
				var city = L.marker([list[i].x-20,list[i].y-75],{icon:labelIcon,interactive:false}).addTo(map);
			} else {
				var city = L.marker([list[i].x+30,list[i].y-75],{icon:labelIcon,interactive:false}).addTo(map);
			}

			var testing = L.marker([list[i].x,list[i].y],{icon: placeIcon}).addTo(map);
			testing.index = i;
			testing.on('click', function(){
				var latlng = this.getLatLng();
				var title = list[this.index].title;
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
		
						xmlDoc = xhttp.responseXML;

						var info = xmlDoc.getElementsByTagName('landmark');
						var type = info[0].getAttribute('type');
						if (type == 'Village') {
							var symbol = '<img style="float:right;" src="images/village.png" alt="'+type+'">';
						}
						if (type == 'City') {
							var symbol = '<img style="float:right;" src="images/city.png" alt="'+type+'">';
						}
						if (type == 'Fortress') {
							var symbol = '<img style="float:right;" src="images/fortress.png" alt="'+type+'s">';
						}
						if (type == 'Oasis') {
							var symbol = '<img style="float:right;" src="images/oasis.png" alt="'+type+'">';
						}
						if (type == 'Ruins') {
							var symbol = '<img style="float:right;" src="images/ruins.png" alt="'+type+'">';
						}
						if (type == 'Special') {
							var symbol = '<img style="float:right;" src="images/special.png" alt="'+type+'">';
						}
						var pop = info[0].getAttribute('population');
						var ref = info[0].getAttribute('ref');

						var content = xmlDoc.getElementsByTagName('text');
						var details = content[0].childNodes[1].data;

						var txt = '<h3>' + title + '</h3>' + symbol + 'Type: ' + type + '<br>Population: ' + pop + '<br><br>' + details + '<br><hr><br><i>Reference: ' + ref + '</i>';
								
						L.popup({maxWidth:600, keepInView:true}).setLatLng(latlng).setContent(txt).openOn(map);
					}
				};
				xhttp.open('GET', 'xmldata/'+list[this.index].content+'.xml', true);
				xhttp.send();
			});
		}		
	}
};
xhttp.open('GET', 'xmldata/locations.xml', true);
xhttp.send();