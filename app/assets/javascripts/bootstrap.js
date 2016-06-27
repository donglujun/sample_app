jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
  if ($(".main").length == 0) {
    $("body").css("overflow", "auto");
  }
});
