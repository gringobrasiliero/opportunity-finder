//Submit comments via AJAX
 $(function() {

  $("a.load_applications").on("click", function(e){

    $.ajax({
      method: "GET",
      url: this.href

    })
      .done(function(data) {
        console.log(data)
      $("div.applications").append(data)
      });


    alert("Howdy")
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
