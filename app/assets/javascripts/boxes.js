jQuery(function() {
  return $('#box_item_tokens').tokenInput('/box.json', {
    theme: 'facebook',
    prePopulate: $('#box_item_tokens').data('load')
  });
});