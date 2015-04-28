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
    setTimeout(update_worker, 10000);
  })();
}

// For removing a track after it's been destroyed
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

function hide_popovers()
{
  $('.popover-markup>.trigger').each(function() {
      $(this).popover('hide');
  });  
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

function bind_quick_hides()
{
  $('.quick_hide').on("click", function(event)
  {
    quick_hide(this);
  });

  $('.quick_hide_parent').on("click", function(event)
  {
    quick_hide_parent(this);
  });
}

function bind_hide_and_submit()
{
  $('.hide_and_submit').on("click", function(event)
  {
    $(this).parent().submit();
    $(this).parent().parent().remove();
  });
}

function bind_click_clear()
{
  $('.click_clear').on("click", function(event)
  {
    $(this).val('');
  });
}

function add_temporary_row_color(id, type)
{
  row = $('#' + id);
  row.addClass(type);
  remove_color = function() { row.removeClass(type); }
  window.setTimeout("remove_color();", 3000);
}

function load_subreddits(subreddits_path)
{
  $.ajax({
    url: subreddits_path,
    dataType: 'script'
  });
}

function load_links(links_path)
{
  $.ajax({
    url: links_path,
    dataType: 'script'
  });
}

function start_search_loading()
{
  $('#links_content').hide();
  $('#links_more').hide();
  $('#links_loading').show();
}

function stop_search_loading()
{
  $('#links_content').show();
  $('#links_loading').hide();
  $('#links_more').show();
}


function bind_search_loading()
{
  $('#link_search_btn').on("click", function(e) {
    start_search_loading();
  });
}

function bind_sub_searches()
{
  $('.user_sub').on("click", function(e) {
    start_search_loading();
  });
}

$(function() {
  if(typeof(gon) != 'undefined')
  {
    bind_quick_hides();
    bind_click_clear();
    bind_search_loading();

    $('#start_tour').on("click", function(event) {
      introJs().setOptions({ 'tooltipPosition': 'right' }).start();
    });

    // Check we're on the dashboard, then start update worker
    
    window.setTimeout("load_links('" + gon.links_path + "');", 1000);
    window.setTimeout("load_subreddits('" + gon.subreddits_path + "');", 2000);
    window.setTimeout("update_tracks();", 10000);
  }
});
