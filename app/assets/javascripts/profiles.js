$(function () {
function Profile(attributes){
this.first_name = attributes.first_name;
this.id = attributes.id;
this.last_name = attributes.last_name;
this.location = attributes.location;
this.picture_url = attributes.picture_url;
this.profession = attributes.profession;
this.email = attributes.email;
}

// Profile.templateSource = $("opp-template").html()
Profile.templateSource = $("#applicant-profile").html();
Profile.template = Handlebars.compile(Profile.templateSource);
Profile.prototype.renderProfileDiv = function() {
return Profile.template(this)
}


// $(".load_applications").click(function(e){
//   alert("HOWDY")
// e.preventDefault();
//   var id = $(this).data("id");
//   $.get("/opportunities/" + id + ".json")
//   .success(function(data) {
//     // console.log(data["opportunity"]["applications"])
//
//     var $div = $("#oppApps-" + id)
//
//
//     $div.html("") //empties the div
//     var oppApps = data
//     oppApps.forEach(function(json) {
//   var profile = Profile(json);
//     var $profileDiv = profile.renderProfileDiv()
//       console.log(json)
//     $div.append($profileDiv)
//
//         $div.append(json["profile"]["first_name"])
//           $div.append(json["profile"]["last_name"])
//             $div.append(json["profile"]["picture_url"])
//             $div.append(json["profile"]["location"])
// // $div.append(json.profile.first_name)
//     })
// });
//
// });

// This works in console
 // $("#oppApps-" + 1).append(Handlebars.compile($("#applicant-profile").html())









    });
