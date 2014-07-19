function update_tracks()
{  // Sets update worker as recurring timeout rather than interval
  (function update_worker() {
    if(gon.user_tracks.length > 0)
    {
      link_id = gon.user_tracks.shift();
      $.ajax({
        type: "POST",
        url: '/users/' + gon.user_id + '/tracks/' + link_id,
        data: { _method:'PUT' },
        dataType: 'script',
      }).complete(function(){
        gon.user_tracks.push(link_id);
      });
    }
    setTimeout(update_worker, 5000);
  })();
}

function remove_from_array(arr) {
    var what, a = arguments, L = a.length, ax;
    while (L > 1 && arr.length) {
        what = a[--L];
        while ((ax= arr.indexOf(what)) !== -1) {
            arr.splice(ax, 1);
        }
    }
    return arr;
}

$(function() {
  // Check we're on the dashboard, then start update worker
  if(typeof(gon) != 'undefined')
  {
    window.setTimeout("update_tracks();", 5000);
  }
});
