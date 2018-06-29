//Submit comments via AJAX
 $(function() {


   // $(".new_opportunity").on("click", function(e){
   //    $.get("/opportunities/new.json")
   //   .success(function(data) {
   //     // console.log(data["opportunity"]["applications"])
   //     var $div = $("#newOpp")
   //     $div.html("") //empties the div
   //     $div.append('<h1>This button works. Kinda.</h1>')
   //
   // });
   // e.preventDefault();
   // });














  $(".load_applications").on("click", function(e){
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

      })
});
  e.preventDefault();
});

$(".load_application").on("click", function(e){
  var id = $(this).data("id");
  $.get("/applications/" + id + ".json")
  .success(function(json) {
var $div = $("#applicant-" + id)
$div.html("") //empties the div
  console.log(json)
$("#applicant-" + id).append('<h2>Application</h2>')
$div.append('<div class="field"><h3>Qualified for Position: ' + json["qualified"] + '</h3></div>')
$div.append('<div class="field"><h3>Reliable Transportation: ' + json["transportation"] + '</h3></div>')
$div.append('<div class="field"><h3>Criminal Record: ' + json["criminal_record"] + '</h3></div>')
$div.append('<div class="field"><h3>Description of Criminal Record: ' + json["description_of_criminal_record"] + '</h3></div>')
$div.append('<div class="field"><h3>Legal to work in USA: ' + json["legal"] + '</h3></div>')
$div.append('<div class="field"><h3>Month Commitment: ' + json["month_commitment"] + '</h3></div>')
$div.append('<div class="field"><h3>Reason for Interest: ' + json["reason_for_interest"] + '</h3></div>')
// $div.append('<a href="' + id + '" class= "hide_application" data-id="' + id + '">Hide Applications</a>')
});
// <a href="<%=opportunity_path(opportunity)%>" class= "load_applications" data-id="<%=opportunity.id%>">View Applicants</a>

e.preventDefault();
});

$(".hide_application").on("click", function(e){
  var id = $(this).data("id");
  $.get("/applications/" + id + ".json")
  .success(function(json) {
var $div = $("#applicant-" + id)
$div.html("") //empties the div
});

e.preventDefault();
});


// End of function
});
