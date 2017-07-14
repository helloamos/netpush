// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require bootstrap
//= require turbolinks

//= require_tree .



$(function () {
  $('[data-toggle="popover"]').popover();
})

/* Enable bootstrap tooltip */
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
$(document).on 'ready page:load', ->
    CountryStateSelect({ country_id: "country_field_id", state_id: "state_field_id" })

     $(document).ready(function(){
        $('.dropdown-toggle').dropdown();
    });