$(document).ready(function(){
  var i = 0;
  $('.booth-form-add').bind('click', function(){
    var form_template = '<input placeholder="Size" type="number" name="tradeshow[booths_attributes]['+i+'][size]" id="tradeshow_booths_attributes_'+ i +'_size">' ;
    $('.booth-form-group').append(form_template);
    i++
  });
})
