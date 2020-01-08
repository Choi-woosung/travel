<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/w3.css">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	font-family: arial;
	font-size: 13px;
	overflow: hidden;
}

#map_canvas {
	float: left;
	width: 100%;
	height: 100%;
}

#listing {
	float: left;
	margin-left: 1px;
	width: 100%;
	overflow: auto;
	cursor: pointer;
}

#controls {
	padding: 5px;
	width: 100%;
}

.placeIcon {
	width: 16px;
	height: 16px;
	margin: 2px;
}

#results {
	border-collapse: collapse;
	width: 100%;
}

#locationField {
	margin-left: 1px;
	width: 100%;
}

#autocomplete {
	border: 1px solid #ccc;
	width: 100%;
}


#infobox {
	background-color: white;
	position: absolute;
	top: 0px;
	left: 0px;
	width: 408px;
	height: 100%;
	z-index: 10;
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	-ms-transition: all 0.2s;
	-o-transition: all 0.2s;
	transition: all 0.2s;
	overflow-y : scroll;
	overflow-x : hidden;
}

#sidebar-toggle {
	display: flex;
	align-items: center;
	justify-content: center;
	background : white;
	width: 50px;
	height: 100px;
	position: absolute;
	top: 70px;
	left: 408px;
	z-index: 11;
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	-ms-transition: all 0.2s;
	-o-transition: all 0.2s;
	transition: all 0.2s;
}

.sidebar-active {
	overflow-y: auto;
	overflow : hidden;
	-webkit-transform: translate3d(-408px, 0, 0);
	-moz-transform: translate3d(-408px, 0, 0);
	transform: translate3d(-408px, 0, 0);
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	-ms-transition: all 0.2s;
	-o-transition: all 0.2s;
	transition: all 0.2s;
}

.resultData{
	display: flex;
}

.resultData-left{
	flex : 8;
}

.resultData-right{
	flex : 2;
}

.schedule_addBtn {
	width : 100%;
	height : 30px;
	border-radius : 5px;
}



</style>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
		var type;
		var eventId;
		var map, places, iw;
		var markers = [];
		var autocomplete;
		var options;
		var liCnt;
		
		$(function(){
			$("#sidebar-toggle").click(function(){
				$("#infobox").toggleClass("sidebar-active");
				$('#sidebar-toggle').toggleClass("sidebar-active");
			});
			
			$(document).mousemove(function(e){
			    $('.mouse_event').css("top", e.pageY);
			    $('.mouse_event').css("left", e.pageX);
			});
			$('.icons').click(function(){
				type = this.id;
				search();
			});
		});
		
		function searchPlace(listType, eId, cnt){
			type = listType;
			eventId = eId;
			liCnt = cnt;
			search();
		}
		 
		function initialize() {
			var myLatlng = new google.maps.LatLng(37.566535, 126.97796919999996); 
			var myOptions = {
				zoom: 18,
				center: myLatlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
			places = new google.maps.places.PlacesService(map);
 			google.maps.event.addListener(map, 'tilesloaded', tilesLoaded);
 			autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
			google.maps.event.addListener(autocomplete, 'place_changed', function () {
				showSelectedPlace();
			}); 
		}
 
		function tilesLoaded() {
			google.maps.event.clearListeners(map, 'tilesloaded');
			search();
		}

		function showSelectedPlace() {
			clearResults();
			clearMarkers();
			var place = autocomplete.getPlace();
			map.panTo(place.geometry.location);
			markers[0] = new google.maps.Marker({
				position: place.geometry.location,
				map: map
			});
			iw = new google.maps.InfoWindow({
				content: getIWContent(place)
			});
			iw.open(map, markers[0]);
		}

		function search() {
			
			autocomplete.setBounds(map.getBounds());
			var search = {
				bounds: map.getBounds()
			};
			search.types = [type];
			
			places.search(search, function (results, status) {
				if (status == google.maps.places.PlacesServiceStatus.OK) {
					clearResults();
					clearMarkers();
					for (var i = 0; i < results.length; i++) {
						addResult(results[i], i);
					}
				}
			});
		}

		function clearMarkers() {
			for (var i = 0; i < markers.length; i++) {
				if (markers[i]) {
					markers[i].setMap(null);
					markers[i] == null;
				}
			}
		}

		function dropMarker(i) {
			return function () {
				markers[i].setMap(map);
			}
		}

		function addResult(result, i) {
			places.getDetails({placeId : result.place_id}, 
					function(place, status){
				console.log(status);
				  if (status == google.maps.places.PlacesServiceStatus.OK) {
					addResultMarker(result, i);
					addResultList(place);
				 } 				  
			});
		}

		function clearResults() {
			var results = document.getElementById('results');
			while (results.childNodes[0]) {
				results.removeChild(results.childNodes[0]);
			}
		}

		function getDetails(result, i) {
			return function () {
				places.getDetails({
					reference: result.reference
				}, showInfoWindow(i));
			}
		}

		function showInfoWindow(i) {
			return function (place, status) {
				if (iw) {
					iw.close();
					iw = null;
				}
				if (status == google.maps.places.PlacesServiceStatus.OK) {
					iw = new google.maps.InfoWindow({
						content: getIWContent(place)
					});
					iw.open(map, markers[i]);
				}
			}
		}

		function getIWContent(place) {
			var content = '<table style="border:0"><tr><td style="border:0;">';
			content += '<img class="placeIcon" src="' + place.icon + '"></td>';
			content += '<td style="border:0;"><b><a href="' + place.url + '">' + place.name + '</a></b>';
			content += '</td></tr></table>';
			return content;
		}
		
		function addResultList(place){
			var name = document.createTextNode(place.name);
			var url = document.createTextNode(place.url);
			var rating;
			if(typeof place.rating == "undefined"){
				rating = document.createTextNode("별점 없음");
			} else {
				rating = document.createTextNode(place.rating);
			}
			var address = document.createTextNode(place.formatted_address);
			var photo;
			
			var results = document.getElementById('results');
 			var row = document.createElement('div');
			row.setAttribute('class', 'resultData p-3 list-group-item list-group-item-action');
			var leftDiv = document.createElement('div');
			leftDiv.setAttribute('class', 'resultData-left');
			var rightDiv = document.createElement('div');
			rightDiv.setAttribute('class', 'resultData-right');
			rightDiv.setAttribute('id', 'rightDiv');
			var nameh4 = document.createElement('h6');
			var addressh6 = document.createElement('h6');
			var ratingh6 = document.createElement('h6');
			ratingh6.appendChild(rating);
			addressh6.appendChild(address);
			try{
				photo = place.photos[0].getUrl();
			} catch (e) {
				photo = "/img/icon/hotel.png";
			}
			var photoLink = document.createElement('img');
			var btn = document.createElement('button');
			var btnText = document.createTextNode("스케쥴에 추가");
			btn.setAttribute('class', 'schedule_addBtn');
			btn.setAttribute('data-dismiss', 'modal');
			btn.appendChild(btnText);
			
			photoLink.src= photo;
			photoLink.width = 100;
			photoLink.height = 100;
			
			leftDiv.appendChild(nameh4);	
			nameh4.appendChild(name);
			leftDiv.appendChild(addressh6);
			leftDiv.appendChild(address);
			leftDiv.appendChild(ratingh6);
			rightDiv.appendChild(photoLink);
			rightDiv.appendChild(btn);
			row.appendChild(leftDiv);
			row.appendChild(rightDiv);
			results.appendChild(row);
			
			row.onclick = function(){
				google.maps.event.trigger(markers[i], 'click');
			};
			
			btn.onclick = function(){
				var targetLi = document.getElementById(eventId);
				targetLi.innerHTML = '<div class="d-flex w-100 justify-content-between">'
									+ '<h5 class="mb-1">' + place.name + '</h5>'
									+ '<small class="text-muted">' + liCnt + '</small>'
									+ '</div>'
									+ '<p class="mb-1 text-left">' +place.formatted_address+ '</p>'
									+ '<input type="text" name="body">';
				}
		}
		
		function addResultMarker(result, i){
			console.log(result.geometry.location);
			console.log(i);
			markers[i] = new google.maps.Marker({
				position: result.geometry.location,
				animation: google.maps.Animation.DROP
			});/* 
			google.maps.event.addListener(markers[i], 'click', getDetails(result, i)); */
			setTimeout(dropMarker(i), i * 100);
		}
		
		function sleep(milliseconds) {
			  var start = new Date().getTime();
			  for (var i = 0; i < 1e7; i++) {
			    if ((new Date().getTime() - start) > milliseconds){
			      break;
			    }
			  }
			}
		
		google.maps.event.addDomListener(window, 'load', initialize);
		
	</script>
</head>
<body>
	<div id="map_canvas"></div>
	<div id="sidebar-toggle" class="shadow border-bottom border-left">
		<img src="/img/icon/arrow-bar-left.svg" alt="" width="32" height="32" title="Bootstrap">
	</div>
	<div id="infobox">
		<div id="locationField">
			<input id="autocomplete" type="text">
		</div>
		<div id="listing">
			<div id="results"></div>
		</div>
	</div>
</body>
</html>