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
		#infobox{
			background-color: white;
			position: absolute;
			top: 0px;
			left: 0px;
			width: 408px;
			height: 100%;
			z-index: 10;
		}
	</style>
<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH7Hg6_GJq3uKTQJdLZudqW_vQHbRcy0s&sensor=false&libraries=places"></script>
	<script type="text/javascript">
		var map, places, iw;
		var markers = [];
		var autocomplete;

		function initialize() {
			var myLatlng = new google.maps.LatLng(37.566535, 126.97796919999996);
			var myOptions = {
				zoom: 14,
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
			google.maps.event.addListener(map, 'zoom_changed', search);
			google.maps.event.addListener(map, 'dragend', search);
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
			var type;
			for (var i = 0; i < document.controls.type.length; i++) {
				if (document.controls.type[i].checked) {
					type = document.controls.type[i].value;
				}
			}
			autocomplete.setBounds(map.getBounds());
			var search = {
				bounds: map.getBounds()
			};
			if (type != 'establishment') {
				search.types = [type];
			}
			places.search(search, function (results, status) {
				if (status == google.maps.places.PlacesServiceStatus.OK) {
					clearResults();
					clearMarkers();
					for (var i = 0; i < results.length; i++) {
						markers[i] = new google.maps.Marker({
							position: results[i].geometry.location,
							animation: google.maps.Animation.DROP
						});
						google.maps.event.addListener(markers[i], 'click', getDetails(results[i], i));
						setTimeout(dropMarker(i), i * 100);
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
			var results = document.getElementById('results');
			var tr = document.createElement('tr');
			tr.style.backgroundColor = (i % 2 == 0 ? '#F0F0F0' : '#FFFFFF');
			tr.onclick = function () {
				google.maps.event.trigger(markers[i], 'click');
			};
			var iconTd = document.createElement('td');
			var nameTd = document.createElement('td');
			var icon = document.createElement('img');
			icon.src = result.icon.replace('http:', '');
			icon.setAttribute('class', 'placeIcon');
			var name = document.createTextNode(result.name);
			iconTd.appendChild(icon);
			nameTd.appendChild(name);
			tr.appendChild(iconTd);
			tr.appendChild(nameTd);
			results.appendChild(tr);
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
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</head>
<body>﻿
	<div id="map_canvas"></div>
	<div id="infobox">
		<div id="locationField">
			<input id="autocomplete" type="text">
		</div>
		<div id="controls">
			<form name="controls">
				<input type="radio" name="type" value="establishment" onclick="search()" checked="checked" />기관, 시설
				<br/>
				<input type="radio" name="type" value="hospital" onclick="search()" />병원
				<br/>
				<input type="radio" name="type" value="restaurant" onclick="search()" />레스토랑
				<br/>
				<input type="radio" name="type" value="subway_station" onclick="search()" />지하철
				<br/>
				<input type="radio" name="type" value="lodging" onclick="search()" />숙박업소
			</form>
		</div>
		<div id="listing">
			<table id="results"></table>
		</div>
	</div>
</body>
</html>