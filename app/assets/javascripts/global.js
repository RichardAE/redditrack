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
    setTimeout(update_worker, 7000);
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

function bind_popovers_on_links()
{
  $('.popover-markup>.trigger').popover({
      html: true,
      title: function () {
          return $(this).parent().find('.head').html();
      },
      content: function () {
          return $(this).parent().find('.content').html();
      },
      placement: "left"
  });
}

function quick_hide_parent(element)
{
  $(element).closest('div').remove();
}

function quick_hide(element)
{
  $(element).closest('a').hide();
}

function bind_click_clear()
{
  $('.click_clear').on("click", function(event)
  {
    $(this).val('');
  });
}

$(function() {
  bind_popovers_on_links();
  bind_click_clear();

  // Check we're on the dashboard, then start update worker
  if(typeof(gon) != 'undefined')
  {
    window.setTimeout("update_tracks();", 10000);
  }
});
