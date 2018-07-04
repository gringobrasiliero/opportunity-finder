(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['index'] = template({"compiler":[7,">= 4.0.0"],"main":function(container,depth0,helpers,partials,data) {
    var helper, alias1=depth0 != null ? depth0 : (container.nullContext || {}), alias2=helpers.helperMissing, alias3="function", alias4=container.escapeExpression;

  return "<div id=\"oppApps-"
    + alias4(((helper = (helper = helpers.id || (depth0 != null ? depth0.id : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"id","hash":{},"data":data}) : helper)))
    + "\">\r\n  <section>\r\n  <div class=\"photo\">\r\n    <img src=\""
    + alias4(((helper = (helper = helpers.picture_url || (depth0 != null ? depth0.picture_url : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"picture_url","hash":{},"data":data}) : helper)))
    + "\">\r\n  </div>\r\n  <div class = \"Application\">\r\n    <div class=\"field\">\r\n      <h2>Name: "
    + alias4(((helper = (helper = helpers.first_name || (depth0 != null ? depth0.first_name : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"first_name","hash":{},"data":data}) : helper)))
    + " "
    + alias4(((helper = (helper = helpers.last_name || (depth0 != null ? depth0.last_name : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"last_name","hash":{},"data":data}) : helper)))
    + " </h2>\r\n    </div>\r\n\r\n    <div class=\"field\">\r\n      <h3>Email:\r\n        <a href= \"mailto:"
    + alias4(((helper = (helper = helpers.email || (depth0 != null ? depth0.email : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"email","hash":{},"data":data}) : helper)))
    + "\"> "
    + alias4(((helper = (helper = helpers.email || (depth0 != null ? depth0.email : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"email","hash":{},"data":data}) : helper)))
    + " </a>\r\n      </h3>\r\n\r\n    </div>\r\n\r\n    <div class=\"field\">\r\n      <h3>Location: "
    + alias4(((helper = (helper = helpers.location || (depth0 != null ? depth0.location : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"location","hash":{},"data":data}) : helper)))
    + "</h3>\r\n    </div>\r\n\r\n    <div class=\"field\">\r\n      <h3>Profession: "
    + alias4(((helper = (helper = helpers.profession || (depth0 != null ? depth0.profession : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"profession","hash":{},"data":data}) : helper)))
    + "</h3>\r\n    </div>\r\n</div>\r\n";
},"useData":true});
})();