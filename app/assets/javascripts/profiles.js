class Profile {

  constructor(attributes){ //Model Object
    this.firstName = attributes.first_name;
    this.id = attributes.id;
    this.lastName = attributes.last_name;
    this.location = attributes.location;
    this.pictureUrl = attributes.picture_url;
    this.profession = attributes.profession;
    this.email = attributes.email;
    this.name = function() {
      return attributes.first_name + " " + attributes.last_name
    }

  };

  renderDiv() {
    return Profile.template(this)
  }


} //end of Class

$(function() {
  var $button = $(".hide_applicant");
  $button.hide();
  $(".load_applicants").click(function(e){
    Profile.templateSource = $("#applicant").html();
    Profile.template = Handlebars.compile(Profile.templateSource); //Handlebars template
    var id = $(this).data("id");
    $.get("/opportunities/" + id + ".json") //AJAX
    .success(function(data) {
      var $div = $("#oppApps-" + id)
      $div.html("") //empties the div
      var oppApps = data
       oppApps.sort(function(a, b){
        if(a.profile.location.toLowerCase() < b.profile.location.toLowerCase()) return -1;
        if(a.profile.location.toLowerCase() > b.profile.location.toLowerCase()) return 1;

        return 0;
      })

      oppApps.forEach(function(json) {

        var applicationProfile = new Profile(json["profile"]); //creates model object
        var applicationDiv = applicationProfile.renderDiv()
          var button = $("#button-" + id)
          var loadPro = $("#load-applicant-" + id)
          loadPro.hide()
          button.show()
        console.log($("#applicant"))
        console.log(json)
        $div.append(applicationDiv) //renders div
