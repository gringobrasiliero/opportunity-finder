# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements

- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  - On the Opportunities Show page, clicking on the button "View Application" renders the applicants application.


- [X] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  - On the Opportunities Index page, clicking on the link "View Applicants", renders all of the profiles of the people who applied for that opportunity.

- [X] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  - Opportunities has_many applications. Refer to Opportunity_serializer.rb, line 3.
- [X] Use your Rails API and a form to create a resource and render the response without a page refresh.
  -On the Opportunities Create page, Submitting the application renders the submitted application onto the page.

- [X] Translate JSON responses into js model objects.
  - Profiles, Applications, and Opportunities are all js model objects. Refer to Opportunities.js, Applications.js, and Profiles.js.

- [X] At least one of the js model objects must have at least one method added by your code to the prototype.
  - Profile.js, Application.js, and Opportunity.js all have a method that renders the template to be appended to the DOM. Profile.js also has a method that returns the first and last name.
Confirm
- [X] You have a large number of small Git commits
- [X] Your commit messages are meaningful
- [X] You made the changes in a commit that relate to the commit message
- [X] You don't include changes in a commit that aren't related to the commit message
