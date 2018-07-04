//Submit comments via AJAX


   function Application(attributes){
     this.qualified = attributes.qualified;
     this.id = attributes.id;
     this.legal = attributes.legal;
     this.month_commitment = attributes.month_commitment;
     this.reason_for_interest = attributes.reason_for_interest;
     this.transportation = attributes.transportation;
     this.criminal_record = attributes.criminal_record;
     this.first_name = attributes.profile.first_name;
     this.last_name = attributes.profile.last_name;
     this.location = attributes.profile.location;
     this.picture_url = attributes.profile.picture_url;
     this.profession = attributes.profile.profession;

   }

  $(function() {
   Application.templateSource = $("#applicant").html();

   Application.template = Handlebars.compile(Application.templateSource);
 })
   Application.prototype.renderDiv = function() {
   return Application.template(this)
 };

//  $(function() {
//  Application.appTemplateSource = $("#application-template").html();
//
//  Application.appTemplate = Handlebars.compile(Application.appTemplateSource);
// })
//  Application.prototype.renderAppDiv = function() {
//  return Application.appTemplate(this)
//  };

$(function() {
 $(".load_applications").click(function(e){
   var id = $(this).data("id");
   $.get("/opportunities/" + id + ".json")
   .success(function(data) {
     // console.log(data["opportunity"]["applications"])
     var $div = $("#oppApps-" + id)
     $div.html("") //empties the div
     var oppApps = data
     oppApps.forEach(function(json) {
       var applicationProfile = new Application(json);
       var applicationDiv = applicationProfile.renderDiv()

       console.log($(".applicant-profile"))
       console.log(json)

       $div.append(applicationDiv)
             $div.append(json["profile"]["profession"])
     })
});
 e.preventDefault();
});
})

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
})





$(function() {
  alert("JIII");
  var $button = $(".hide_application");
  $button.hide();

$(".load_application").click(function(e){
// it works if prevent default is here
  e.preventDefault();
  var id = $(this).data("id");
  $.get("/applications/" + id + ".json")
  .success(function(json) {
var $button = $("#button-" + id)
var $div = $("#applicant-" + id)
var $loadApp = $("#load-application-" + id)
var applicationProfile = new Application(json);
var applicationDiv = applicationProfile.renderDiv()


$loadApp.hide()
$button.show()
$div.show()
$div.html(""); //empties the div
  console.log(json)
    $div.append(applicationDiv)
});


});
})
$(function() {
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
})

// End of function
// });
