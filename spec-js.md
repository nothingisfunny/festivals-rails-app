# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements 
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
	Festival show page loads edit page using ajax and then when the edit is submitted renders updated show resource back to the page using jQuery, Active Model Serialization and Handlebars template.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
	The festivals filter on the index page was updated to render new filtered results using jQuery.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
	On the festival show page the comments are being rendered on click of "show comments" button via JSON.
- [x] Include at least one link that loads or updates a resource without reloading the page.
	New comment can be created and added to the page in the comments section.
- [x] Translate JSON responses into js model objects.
	Created Festival object with various properties in order to load festival show page via json.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
	Festival model object has a renderShow method that returns Handlebars template for that particular festival.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
