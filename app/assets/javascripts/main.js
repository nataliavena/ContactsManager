// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("click", "#table-id tr", function(){
    var link = $(this).data("href")
    $.ajax({
        url: link,
        type: "GET"
    });
});
