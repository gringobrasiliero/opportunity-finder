
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

$(function() {
  $('form').click("submit", function(e) {
    // debugger
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
      alert("New Opportunity Created!")
      $("div.new_opportunity").append(opportunityDiv)
          $("form")[0].reset();

    })
    .error(function(response){
    console.log("Broken", response)
    })

  });


})



$(function () {
var click_count = 0
  $(".next_opportunity").on("click", function (e){


    var id = $(this).data("id");
    var new_id = id + click_count
      $.get("/opportunities/" + new_id + ".json")
      .success(function(json) {
        var $div = $("#opportunity")
        $div.html("")
        var $nextOpportunity = new Opportunity(json);
          console.log($nextOpportunity)
         //creates model object
        var opportunityDiv = $nextOpportunity.renderDiv()
        click_count+=1
        $div.append(opportunityDiv)
    console.log(id)
    e.preventDefault();
  })
  .error(function(response){
    click_count = 0
  console.log("Broken", response)
  })
  });
});

$(function () {
var click_count = 0
  $(".prev_opportunity").on("click", function (e){
    var id = $(this).data("id");
    var new_id = id - click_count
      $.get("/opportunities/" + new_id + ".json")
      .success(function(json) {
        var $div = $("#opportunity")
        $div.html("")
        var $nextOpportunity = new Opportunity(json);
          console.log($nextOpportunity)
         //creates model object
        var opportunityDiv = $nextOpportunity.renderDiv()
        click_count-=1
        $div.append(opportunityDiv)
    console.log(id)
    e.preventDefault();
  })
  .error(function(response){
    click_count = 0
  console.log("Broken", response)
  })
  });
});
