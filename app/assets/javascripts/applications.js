//Submit comments via AJAX


   function Application(attributes){
     this.qualified = attributes.qualified;
     this.id = attributes.id;
     this.legal = attributes.legal;
     this.month_commitment = attributes.month_commitment;
     this.reason_for_interest = attributes.reason_for_interest;
     this.transportation = attributes.transportation;
     this.criminal_record = attributes.criminal_record;
     }

  $(function() {
   Application.templateSource = $("#applicant").html();

   Application.template = Handlebars.compile(Application.templateSource);
 })
   Application.prototype.renderDiv = function() {
   return Application.template(this)
 };

$(function() {

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
