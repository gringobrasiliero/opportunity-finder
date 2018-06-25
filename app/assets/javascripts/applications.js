//Submit comments via AJAX
 $(function() {

  $(".load_applications").on("click", function(e){
    var id = $(this).data("id");
    $.get("/opportunities/" + id + ".json")
    .success(function(data) {
      // console.log(data["opportunity"]["applications"])

      var oppApps = data["opportunity"]["applications"]

      oppApps.forEach(function(element) {
        console.log(element)
          $("#oppApps-" + id).append(element["legal"])
      })
});
  e.preventDefault();
});

$(".load_application").on("click", function(e){
  var id = $(this).data("id");
  $.get("/applications/" + id + ".json")
  .success(function(data) {
  console.log(data)

});
e.preventDefault();
});





// End of function
});
