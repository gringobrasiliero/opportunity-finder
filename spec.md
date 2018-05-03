# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship- Opportunities have many Applications
- [x] Include at least one belongs_to relationship- Profile belongs to User
- [x] Include at least one has_many through relationship - Opportunities has many Users through Applications

- [x] The "through" part of the has_many through includes at least one user submittable attribute -
Applications submittable attributes: legal, month_commitment, reason_for_interest, transportation, criminal_record, description_of_criminal_record

- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup (how e.g. Devise) - Devise
- [x] Include login (how e.g. Devise) - Devise
- [x] Include logout (how e.g. Devise) - Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) -OmniAuth Linkedin
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
