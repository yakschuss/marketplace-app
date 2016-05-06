// $(document).ready(function(){
//   $('.booth-form-add').bind('click', function(){
//   var new_form = $('.booth-form').last().clone().val('booth-form');
//   var input = new_form.find("input");
//
//   console.log(input);
//
//   //.appendTo('.booth-form-group');
//   });
// })


$(function() {
  $(document).on("click", "#booth_add", function(e) {
    e.preventDefault();
    return $.ajax({
      url: 'booth_add',
      success: function(data) {
        var element;
        element = $(data).html();
        return $('.booth-form-group').append(element);
      },
      error: function(data) {
        return alert("Sorry, There Was An Error!");
      }
    });
  });
});
