
function Profile(attributes){
this.first_name = attributes.first_name;
this.id = attributes.id;
this.last_name = attributes.last_name;
this.location = attributes.location;
this.picture_url = attributes.picture_url;
this.profession = attributes.profession;
this.email = attributes.email;
this.name = function() {
  return attributes.first_name + " " + attributes.last_name
}
};

$(function () {
Profile.templateSource = $("#applicant").html();
Profile.template = Handlebars.compile(Profile.templateSource);
})
Profile.prototype.renderDiv = function() {
return Profile.template(this)
}


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
       var applicationProfile = new Profile(json["profile"]);
       var applicationDiv = applicationProfile.renderDiv()

       console.log($("#applicant"))
       console.log(json)

       $div.append(applicationDiv)

     })
});
 e.preventDefault();
});
})
