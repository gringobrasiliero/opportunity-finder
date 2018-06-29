  $(function () {
function Item(attributes){
  this.title = attributes.title;
  this.id = attributes.id;
  this.description = attributes.description;
}
Item.templateSource = $("#opp-template").html()
Item.template = Handlebars.compile(Item.templateSource);
Item.prototype.renderDiv = function() {
return Item.template(this)
}


    $('form').on("submit", function(e) {
      //prevent form from submitting the default way
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
        var item = new Item(json);
        var itemDiv = item.renderDiv()

        console.log(json)

        $("div.new_opportunity").append(itemDiv)
      })
      .error(function(response){
        console.log("Broken", response)
      })
       })

    })
