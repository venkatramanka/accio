$(document).ready(function(){
  $.slidebars({
    siteClose: false
  });
  consumerToggle();
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

function consumerToggle(){
  $.slidebars.toggle("left");
  $('#right_menu_button').fadeToggle();
}

function searchForService(service){
  $("#services_modal").modal("hide");
  toggleRightMenu();
}

function toggleRightMenu() {
  $.slidebars.toggle("right");
  $('#right_menu_button').fadeToggle();
}

function toggleFullScreen() {
  // if (!document.fullscreenElement &&    // alternative standard method
  //     !document.mozFullScreenElement && !document.webkitFullscreenElement) {  // current working methods
  //   if (document.documentElement.requestFullscreen) {
  //     document.documentElement.requestFullscreen();
  //   } else if (document.documentElement.mozRequestFullScreen) {
  //     document.documentElement.mozRequestFullScreen();
  //   } else if (document.documentElement.webkitRequestFullscreen) {
  //     document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
  //   }
  // } else {
  //   if (document.cancelFullScreen) {
  //     document.cancelFullScreen();
  //   } else if (document.mozCancelFullScreen) {
  //     document.mozCancelFullScreen();
  //   } else if (document.webkitCancelFullScreen) {
  //     document.webkitCancelFullScreen();
  //   }
  // }
}
