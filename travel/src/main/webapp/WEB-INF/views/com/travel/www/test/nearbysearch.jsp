<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

.bodycontext {
	border : 0px;
	border-bottom : 1px solid #dee2e6;
	text-align : left;
	padding-left : 1px;
	width : 265px;
}

.inputPrice {
	margin-top : 5px;
}

.priceLeft {
	margin-left : 128px;
}

.pricecontext {
	width : 100px;
	border : 0px;
	border-bottom : 1px solid #dee2e6;
	text-align : center;
}


input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.pac-container {
	z-index : 1060;
}


</style>
<script type="text/javascript">
		var type;
		var eventId;
		var map, places, iw;
		var markers = [];
		var autocomplete;
		var citySelector;
		var options;
		var liCnt;
		var placeObject;
		var dayCount;
		var markerLocation;
		var tempPrice = 0;

		
		$(function(){
			$("#sidebar-toggle").click(function(){
				$("#infobox").toggleClass("sidebar-active");
				$('#sidebar-toggle').toggleClass("sidebar-active");
			});
		});
		

		function initialize() {
			var myLatlng = new google.maps.LatLng(37.566535, 126.97796919999996); 
			var myOptions = {
				zoom: 18,
				center: myLatlng,
				mapTypeId: google.maps.MapTypeId.ROADMAP
			};
	        var options = {
	           types : [ 'geocode' ]
	        };
			map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
			places = new google.maps.places.PlacesService(map);
 			autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
 			citySelector = new google.maps.places.Autocomplete(document.getElementById('citySelector'), options);

            google.maps.event.addListener(citySelector, 'place_changed', function() {
               var place = citySelector.getPlace();
               var components = place.address_components;
               var component0 = components[0];
               var component2 = components[2];
               var street0 = component0['long_name'];
               var street2 = component2['long_name'];
               
               $('#sCountry').val(street2);
               $('#sArea').val(street0);
            });
			google.maps.event.addListener(autocomplete, 'place_changed', function () {
				showSelectedPlace();
			});
		}
		

		// 자유 스케쥴 마커 추가하는 기능
		
		function selfAddedMarker(){
			google.maps.event.addListener(map, 'click', function(event) {
			if(type != "freeSchedule") return;
			markerLocation = event.latLng;
			createMarker(event.latLng);
			});
		}
		
		function createMarker(markerLocation){
			markers[0] = new google.maps.Marker({
				position: markerLocation,
				map: map
				});
			
			var contentString = '<div data-toggle="modal" data-target="#dataModal" onclick="addFreeResult(markerLocation)">'
								+ "이 장소를 스케쥴에 추가"
								+ '</div>';

			var infowindow = new google.maps.InfoWindow({
				content: contentString
				});
				infowindow.open(map,markers[0]);
		}
		 
 
		function tilesLoaded() {
			google.maps.event.clearListeners(map, 'tilesloaded');
			search();
		}
		

		// 현재 클릭한 li의 구글 맵 타입과 아이디, cnt 반환해주는 기능
		function searchPlace(listType, eId, cnt, dayCnt){
			type = listType;
			eventId = eId;
			liCnt = cnt;
			dayCount = dayCnt;
			clearMarkers();
			clearResults();
			if(type != "freeSchedule"){
				search();
			} else{
				document.getElementById('infobox').style.display = 'none';
				selfAddedMarker();
			}
		}
		
		// 자유 스케쥴 li에 추가하는 기능
		
		function addFreeResult(markerLocation){
			var targetLi = document.getElementById(eventId);
			console.log(targetLi);
			targetLi.setAttribute('data-toggle' , null);
			targetLi.setAttribute('data-target' , null);
			targetLi.setAttribute('onclick' , null);
			targetLi.innerHTML = '<div class="d-flex w-100 justify-content-between">'
								+ '<input type="text" class="mb-1" placeholder="제목"></h5>'
								+ '<small class="text-muted">' + liCnt + '</small>'
								+ '</div>'
								+ '<input type="text" class="mb-1 text-left" placeholder="위치를 입력하세요"></p>'
								+ '<div class="content-body-text input-group-sm mb-1" style="display : none;">'
								+ '<input type="text" class="bodycontext" name="body" placeholder="메모" id="testtest"/>'
								+ '<div class="inputPrice"><span class="priceLeft">비용 : </span>'
								+ '<input type="number" class="pricecontext" name="price" placeholder="예상비용" /></div>'
								+ '</div>' 
								+ '</div>'
								+ '<div class="row">'
								+ '<div class="col-sm border mx-3" onclick="textcommit(this, eventId, type)" style="display : none;"><img src="/img/icon/check.svg" alt="" width="16" height="16" title="hammer"></div>'
								+ '<div class="col-sm border mx-3" onclick="modifyContent(eventId, this)"><img src="/img/icon/hammer.svg" alt="" width="16" height="16" title="hammer"></div>'
								+ '<div class="col-sm border mx-3" data-toggle="modal" data-target="#dataModal" onclick="viewThisContent(placeObject)"><img src="/img/icon/search.svg" alt="" width="16" height="16" title="search"></div>'
								+ '<div class="col-sm border mx-3" onclick="removeChildNode(eventId, type)"><img src="/img/icon/trash.svg" alt="" width="16" height="16" title="trash"></div>'
								+ '</div>'
								+ '<input type="text" class="d-none" name ="placeLat" value="'+markerLocation.lat()+'">'
								+ '<input type="text" class="d-none" name ="placeLng" value="'+markerLocation.lng()+'">';
		}
		
		function showSelectedPlace() {
			clearResults();
			clearMarkers();
			var place = autocomplete.getPlace();
			map.panTo(place.geometry.location);
			/* 
			markers[0] = new google.maps.Marker({
				position: place.geometry.location,
				map: map
			});
			iw = new google.maps.InfoWindow({
				content: getIWContent(place)
			});
			iw.open(map, markers[0]);
			*/
			search();
		}
 
		function search() {
			document.getElementById('infobox').style.display = 'block';
			autocomplete.setBounds(map.getBounds());
			var search = {
				bounds: map.getBounds()
			};
			search.types = [type];
			places.search(search, function (results, status) {
				if (status == google.maps.places.PlacesServiceStatus.OK) {
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
				  if (status == google.maps.places.PlacesServiceStatus.OK) {
					addResultMarker(result, i);
					addResultList(place, i);
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
		
		// InfoWindow 보여주는 기능

		function showInfoWindow(i) {
			return function(place, status){
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

		//Infowindow 안 내용
		
		function getIWContent(place) {
			var content = '<table style="border:0"><tr><td style="border:0;">';
			content += '<img class="placeIcon" src="' + place.icon + '"></td>';
			content += '<td style="border:0;"><b><a href="' + place.url + '">' + place.name + '</a></b>';
			content += '</td></tr></table>';
			return content;
		}
		
		// 맵 좌측 창에 리스트 반환해주는 기능
		
		function addResultList(place, i){
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
				google.maps.event.trigger(markers[i], 'click', showInfoWindow(place, i));
			};
			
			btn.onclick = function(){
				makeLiResult(place);
				}
		}
		
		function makeLiResult(place){
			var targetLi = document.getElementById(eventId);
			targetLi.setAttribute('data-toggle' , null);
			targetLi.setAttribute('data-target' , null);
			targetLi.setAttribute('onclick' , null);
			placeObject = place;
			targetLi.innerHTML = '<div class="d-flex w-100 justify-content-between">'
								+ '<h5 class="mb-1">' + place.name + '</h5>'
								+ '<small class="text-muted">' + liCnt + '</small>'
								+ '</div>'
								+ '<p class="mb-1 text-left">' +place.formatted_address+ '</p>'
								+ '<div class="content-body-text input-group-sm mb-1" style="display : none;">'
								+ '<input type="text" class="bodycontext" name="body" placeholder="메모" id="testtest"/>'
								+ '<div class="inputPrice"><span class="priceLeft">비용 : </span>'
								+ '<input type="number" class="pricecontext" name="price" placeholder="예상비용" /></div>'
								+ '</div>' 
								+ '</div>'
								+ '<div class="row">'
								+ '<div class="col-sm border mx-3" onclick="textcommit(this,'+eventId+', type)" style="display : none;"><img src="/img/icon/check.svg" alt="" width="16" height="16" title="hammer"></div>'
								+ '<div class="col-sm border mx-3" onclick="modifyContent('+eventId+', this)"><img src="/img/icon/hammer.svg" alt="" width="16" height="16" title="hammer"></div>'
								+ '<div class="col-sm border mx-3" data-toggle="modal" data-target="#dataModal" onclick="viewThisContent(placeObject)"><img src="/img/icon/search.svg" alt="" width="16" height="16" title="search"></div>'
								+ '<div class="col-sm border mx-3" onclick="removeChildNode('+eventId+', type)"><img src="/img/icon/trash.svg" alt="" width="16" height="16" title="trash"></div>'
								+ '</div>'
								+ '<input type="text" class="d-none" name ="pid" value="'+place.place_id+'">'
								+ '<input type="text" class="d-none" name ="type" value="'+type+'">'
								+ '<input type="text" class="d-none" name ="placeName" value="'+place.name+'">'
								+ '<input type="text" class="d-none" name ="liCnt" value="'+liCnt+'">'
								+ '<input type="text" class="d-none" name ="placeAddress" value="'+place.formatted_address+'">'
								+ '<input type="text" class="d-none" name ="dayCount" value="'+dayCount+'">'
								+ '<input type="text" class="d-none" name ="placeLat" value="'+place.geometry.location.lat()+'">'
								+ '<input type="text" class="d-none" name ="placeLng" value="'+place.geometry.location.lng()+'">';
		}
		
		// 맵에 마커 추가 기능
		
		function addResultMarker(result, i){
			markers[i] = new google.maps.Marker({
				position: result.geometry.location,
				animation: google.maps.Animation.DROP
			});
			google.maps.event.addListener(markers[i], 'click', getDetails(result, i));
			setTimeout(dropMarker(i), i * 100);
		}
		
		// 쓰레드 슬립
		
		function sleep(milliseconds) {
			  var start = new Date().getTime();
			  for (var i = 0; i < 1e7; i++) {
			    if ((new Date().getTime() - start) > milliseconds){
			      break;
			    }
			  }
			}
		
		// 리스트 내 li 제거 기능 + 리스트에서 제거 시 비용 다시 계산해주는 함수
		function removeChildNode(eventId, type){
			if(eventId != eventId.parentNode.lastElementChild){
				var targetLi = eventId.parentNode;
				var thisid = eventId.id;
				targetLi.removeChild(eventId);
				var counter = 1;
				var smalls = targetLi.querySelectorAll('small');
				smalls.forEach(e => {
					e.innerHTML = counter;
					counter++;
				});
				counter = 1;
				var liCounter = targetLi.querySelectorAll('input[name="liCnt"]');
				liCounter.forEach(e => {
					e.value = counter;
					counter++;
				});
				var dayCounter = thisid.substring(1, thisid.indexOf("li"));
				var allLis = targetLi.querySelectorAll('li');
				counter = 0;
			} else {
				eventId.parentNode.removeChild(eventId);
			}
			priceCalc(type);
		}
		
		// list 내 li에 body 컨텐츠 추가, 금액 추가  하는 기능
		
		function modifyContent(eventId, ev){
			ev.style.display = 'none';
			ev.previousSibling.style.display = 'block';
			var bodyText = eventId.querySelector('.content-body-text');
			bodyText.style.display = 'block';
			if(eventId.querySelector('input').hasAttribute('readonly')){
				var allInput = eventId.querySelectorAll('input');

				allInput.forEach(e => {
					e.removeAttribute('readonly');
				});
			}
			
		}
		
		
		// 돋보기 눌렀을때 맵 켜지는 버튼 
		function viewThisContent(place) {
			document.getElementById('infobox').style.display = 'none';
			clearResults();
			clearMarkers();
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

		
		// 수정 완료 했을때 작동하는 기능
		
		function textcommit(e, etarget, type){
			var thisbool = false;
			e.style.display = "none";
			e.nextSibling.style.display = 'block';
			var allInput = etarget.querySelectorAll('input');
			var bodyInput = etarget.querySelector('input[name="body"]');
			var priceInput = etarget.querySelector('input[name="price"]');
			allInput.forEach(e => {
				e.setAttribute('readonly', 'true');
			});
			if(bodyInput.value == '' && priceInput.value == ''){
				thisbool = true;
			}
			console.log(thisbool);
			if(thisbool == true){
				var bodyText = etarget.querySelector('.content-body-text');
				bodyText.style.display = 'none';
			}
			var price = parseInt(etarget.querySelector('.pricecontext').value);
			console.log(price);
			if(isNaN(price) == false){
				priceCalc(type);
			}
		}
		
		
		// 비용 계산하는 함수
		function priceCalc(type){
			alert("안들어와?");
			tempPrice = 0;
			var priceId;
			if(type == 'subway_station'){
				priceId = 'trafficPrice';
			} else if(type == "lodging"){
				priceId = 'lodgingPrice';
			} else if(type == "restaurant"){
				priceId = "eatPrice";
			} else {
				priceId = 'otherPrice';
			}
			var thisPrice = document.getElementById(priceId);
			var allPrice = document.querySelectorAll('input[name="price"]');
			
			allPrice.forEach(e => {
				console.log(e);
				console.log(e.value);
				if(e.value == ''){
					return;
				} else {
					tempPrice = tempPrice + parseInt(e.value);
				}
			});
			thisPrice.innerHTML = tempPrice;
			totalCalc();
		}
		
		function totalCalc(){
			var total = document.getElementById('totalPrice');
			var tP = parseInt(document.getElementById('trafficPrice').innerHTML);
			var eP = parseInt(document.getElementById('eatPrice').innerHTML);
			var lP = parseInt(document.getElementById('lodgingPrice').innerHTML);
			var oP = parseInt(document.getElementById('otherPrice').innerHTML);
			total.innerHTML = tP + eP + lP + oP;
		}
		// 구글 맵 실행되는 함수
		
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