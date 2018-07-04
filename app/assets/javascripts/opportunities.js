
function Opportunity(attributes){
  this.title = attributes.title;
  this.id = attributes.id;
  this.description = attributes.description;
}

$(function () {
  Opportunity.templateSource = $("#applicant").html();
  Opportunity.template = Handlebars.compile(Opportunity.templateSource);
})

Opportunity.prototype.renderDiv = function() {
  return Opportunity.template(this)
};

$(function () {
  $('form').on("submit", function(e) {
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    })
    .success(function(json){
      var opportunity = new Opportunity(json);
      var opportunityDiv = opportunity.renderDiv()
      console.log(json)
      $("div.new_opportunity").append(opportunityDiv)
    })
    .error(function(response){
    console.log("Broken", response)
    })
  });
})

$(function () {
  $(".load_opportunity_form").click(function(e){
    e.preventDefault();
    $.get("/opportunities/new.json")
    .success(function(data) {
    var $div = $("#newOpp")
    $div.html("") //empties the div
    $div.append('<h1>This button works. Kinda.</h1>')
    });
  });
});
