# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship
      - Opportunity has_many applications, Opportunity Model line 6
- [x] Include at least one belongs_to relationship
      - Opportunity belongs_to User, Opportunity model line 5
- [x] Include at least one has_many through relationship
      - Opportunity has_many Users through Applications, Opportunity Model, Line 7

- [x] The "through" part of the has_many through includes at least one user submittable attribute -
      - Applications submittable attributes: legal, month_commitment, reason_for_interest, transportation, criminal_record, description_of_criminal_record

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      - Application, Opportunity, User from Devise
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      - Application.best_candidates URL : /opportunities/11?utf8=✓&filter=Best+Qualified&commit=Filter
- [x] Include signup (how e.g. Devise)
      - Devise
- [x] Include login (how e.g. Devise)
      - Devise
- [x] Include logout (how e.g. Devise) 
      - Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      -OmniAuth Linkedin
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      - users/3/opportunities
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
