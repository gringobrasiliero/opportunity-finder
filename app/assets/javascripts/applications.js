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

    // $("#oppApps-" + id).append(data["opportunity"]["applications"]);
});
  // $.ajax({
  //   method: "GET",
  //   url: this.href
  //
  // })
  //   .done(function(data) {
  //     console.log(data)
  //   $("div.applications").append(data)
  //   });

  e.preventDefault();
});
});

// $(function() {
//
//  $("a.load_applications").on("click", function(e){
//
//    $.ajax({
//      method: "GET",
//      url: this.href
//
//    })
//      .success(function(data) {
//        console.log(data)
//      $("div.applications").append(data)
//      });
//
//
//    alert("Howdy")
//    e.preventDefault();
//  })
// })











//
//
//     $("a.load_applicants").on('click', function(e) {
//   $.ajax({
//     url: this.href,
//     dataType: 'script'
//   }).success(function(response) {
//     $("div.applications").html(response)
//   })
// e.preventDefault();
// })
// })
