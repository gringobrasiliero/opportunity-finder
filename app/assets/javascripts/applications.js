//Submit comments via AJAX

$(function() {
  $("#new_application").on("submit"), function(e) {
    alert("You Clicked Submit")

// need url to submit post request //
url = this.action
console.log(url)

data = {
  'authenticity_token': $("input[name='authenticity_token']").val(),

}
    e.preventDefault();
  })
})
