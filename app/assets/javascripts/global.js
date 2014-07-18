function update_tracks()
{
  // Sets update worker as recurring timeout rather than interval
  (function update_worker() {
    link_id = gon.user_tracks.shift();
    $.ajax({
      type: "POST",
      url: '/users/' + gon.user_id + '/tracks/' + link_id,
      data: { _method:'PUT' },
      dataType: 'script',
    }).complete(function(){
      setTimeout(update_worker, 10000);
      gon.user_tracks.push(link_id);
    });
  })();
}

$(function() {

  // Check we're on the dashboard, then start update worker
  if(typeof(gon) != 'undefined')
  {
    window.setTimeout("update_tracks();", 10000);
  }
});
