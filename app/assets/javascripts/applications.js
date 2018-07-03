//Submit comments via AJAX
 $(function() {

   function Application(attributes){
     this.qualified = attributes.qualified;
     this.id = attributes.id;
     this.legal = attributes.legal;
     this.month_commitment = attributes.month_commitment;
     this.reason_for_interest = attributes.reason_for_interest;
     this.transportation = attributes.transportation;
     this.criminal_record = attributes.criminal_record;
     }

   // Application.templateSource = $("opp-template").html()
   Application.templateSource = $("#applicant-profile").html();

   Application.template = Handlebars.compile(Application.templateSource);
   Application.prototype.renderDiv = function() {
   return Application.template(this)
   }















var $button = $(".hide_application")
$button.hide();

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
      var oppApps = data
      oppApps.forEach(function(json) {

        console.log(json)
          $div.append(json["profile"]["first_name"])
            $div.append(json["profile"]["last_name"])
              $div.append(json["profile"]["picture_url"])
              $div.append(json["profile"]["location"])
// $div.append(json.profile.first_name)
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
var $button = $("#button-" + id)
var $div = $("#applicant-" + id)
var $loadApp = $("#load-application-" + id)
$loadApp.hide()
$button.show()
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
// $div.append('<a href="/applications/' + json["id"] + '" class= "hide_application" data-id="' + json["id"] + '">Hide Application</a>')


});


});

$(".hide_application").click(function(e){
e.preventDefault();

  var id = $(this).data("id");
  $.get("/applications/" + id + ".json")
  .success(function(json) {
    console.log(json)
var $loadApp = $("#load-application-" + id)
var $button = $("#button-" + id)
$loadApp.show()
$button.hide()
var $div = $("#applicant-" + id)
$div.hide() //empties the div
});


});


// End of function
});
