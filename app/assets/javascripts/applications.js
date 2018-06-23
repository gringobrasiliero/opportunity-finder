//Submit comments via AJAX
 $(function() {

  $(".load_applications").on("click", function(e){
    var id = parseInt($(".load_applications").attr("data-id"))
    $.get("/opportunities/" + id + "/opportunity_data.json")
      .done(function(data) {
        console.log(data)
      $("div.applications").append(data)
})
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
  })
})











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
