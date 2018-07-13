
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
  $('form').on("submit", function(e) {
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
    var id = $(this).data("id");
    $(".prev_opportunity").on("click", function (e){
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

$(function() {
  $('.opp-form').on("submit", function(e) {
    // debugger
    e.preventDefault();
    var $form = $(this).find('form');

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
debugger
      var opportunityDiv = opportunity.renderDiv()

      console.log(json)
      alert("New Opportunity Created!")
      $("div.new_opportunity").append(`<h1><a href="/opportunities/${json["id"]}">${json["profile"]["business_name"]}</a></h1>`)
      $("div.new_opportunity").append(`<h2>${json["title"]}</h2>`)
      $("div.new_opportunity").append(`<h2>${json["description"]}</h2>`)
      $("div.new_opportunity").append("<br>")
          $("form")[0].reset();

    })
    .error(function(response){
    console.log("Broken", response)
    })

  });


})


$(function () {
$(".create_form_opp").on("click", function(e){
  $.ajax({
    url: this.href,
    dataType: 'script'
  })

    e.preventDefault();
  })
})
