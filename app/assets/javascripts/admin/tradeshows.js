$(document).ready(function(){
  $('.booth-form-add').bind('click', function(){
    $('.booth-form').last().clone().appendTo('.booth-form-group');
  });
})
