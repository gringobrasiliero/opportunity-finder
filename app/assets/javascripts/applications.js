//Submit comments via AJAX
 $(function() {


   $(".load_opportunity_form").click( function(e){
       e.preventDefault();
      $.get("/opportunities/new.json")
     .success(function(data) {
       // console.log(data["opportunity"]["applications"])
       var $div = $("#newOpp")
       $div.html("") //empties the div
       $div.append('<h1>This button works. Kinda.</h1>')

   });

   });

  $(".load_applications").click(function(e){
    var id = $(this).data("id");
    $.get("/opportunities/" + id + ".json")
    .success(function(data) {
      // console.log(data["opportunity"]["applications"])
      var $div = $("#oppApps-" + id)
      $div.html("") //empties the div
      var oppApps = data["opportunity"]["applications"]

      oppApps.forEach(function(json) {
        console.log(json)
          $div.append(json["legal"])
$div.append(json.profile.first_name)
      })
});
  e.preventDefault();
});

$(".load_application").click(function(e){
// it works if prevent default is here
  e.preventDefault();
  var id = $(this).data("id");
  $.get("/applications/" + id + ".json")
  .success(function(json) {
var $div = $("#applicant-" + id)
$div.show()
$div.html(""); //empties the div
  console.log(json)
$("#applicant-" + id).append('<h2>Application</h2>')
$div.append('<div class="field"><h3>Qualified for Position: ' + json["qualified"] + '</h3></div>')
$div.append('<div class="field"><h3>Reliable Transportation: ' + json["transportation"] + '</h3></div>')
$div.append('<div class="field"><h3>Criminal Record: ' + json["criminal_record"] + '</h3></div>')
$div.append('<div class="field"><h3>Description of Criminal Record: ' + json["description_of_criminal_record"] + '</h3></div>')
$div.append('<div class="field"><h3>Legal to work in USA: ' + json["legal"] + '</h3></div>')
$div.append('<div class="field"><h3>Month Commitment: ' + json["month_commitment"] + '</h3></div>')
$div.append('<div class="field"><h3>Reason for Interest: ' + json["reason_for_interest"] + '</h3></div>')
$div.append('<a href="/applications/' + json["id"] + '" class= "hide_application" data-id="' + json["id"] + '">Hide Application</a>')


});


});

$(".hide_application").click(function(e){
e.preventDefault();
  var id = $(this).data("id");
  $.get("/applications/" + id + ".json")
  .success(function(json) {
    console.log(json)

var $div = $("#applicant-" + id)
$div.hide() //empties the div
});


});


// End of function
});
