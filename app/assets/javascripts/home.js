$(document).ready(function(){
  $.slidebars({
    siteClose: false
  });
  $.slidebars.toggle('left');
});

function displayOnMap(position){
  var marker = handler.addMarker({
    lat: position.coords.latitude,
    lng: position.coords.longitude,
    picture: {
          url: "assets/map-marker.png",
          width:  40,
          height: 66
        },
  });
  handler.map.centerOn(marker);
  handler.map.serviceObject.setZoom(12);
};