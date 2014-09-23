// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(function(){
  $("body").on("click", "input[type=radio]",function(){
  	$.cookie('product', this.value, { expires: 7, path: '/' });
  })
});