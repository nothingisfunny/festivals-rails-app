// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require handlebars
//= require_tree .

//create object for festival
function Festival(attributes){
	this.name = attributes.name
	this.id = attributes.id
	this.catefory_id = attributes.category_id
	this.location = attributes.location
	this.venue = attributes.venue
	this.line_up = attributes.line_up
	this.start = attributes.start
	this.end = attributes.end
	this.website = attributes.website
	this.creator_id = attributes.creator_id
	this.world_part_id = attributes.world_part_id
}
$(function(){
	Festival.templateSource = $("#festival-template").html();
	Festival.template = Handlebars.compile(Festival.templateSource);
})




function filterFestivals(){
	var category = $('[name="category"] option:selected').text()
	var world_part = $('[name="world_part"] option:selected').text()
	$.get('/festivals', {category: category, world_part: world_part}, function(data){
		var festivals = $(data).find("#festivals-container").html()
		$('#festivals-container').html(festivals);
	})
}

// GRAB FILTER VALUES
//$('[name="category"] option:selected').text()
//$('[name="world_part"] option:selected').text()

$(function showComments(){
	$(document).on("click", "a.show_comments", function(e){
		$.get(this.href).success(function(json){
			console.log(json)
			$("#comments").append('<h2>' + json.length + ' Comment(s):</h2>')
			json.forEach(function(comment){
				$("#comments").append('<p>' + '<strong>' + comment.username + ' said: </strong>' + comment.content + '</p>');
			})
		})
		$.get(this.href + '/new').success(function(response){
			$("#new-comment-form").append(response);
		})
		$('a.show_comments').remove()
		e.preventDefault();
	})
})
$(function appendComment(){
	$(document).submit("#new_comment", function(event){
		var form = $("#new_comment")[0]
		$.ajax({
			type: form.method, 
			url: form.action,
			data: $(form).serialize(),
			success: function(response){
				$("#comments").append(response);
				$("#comment_content").val('');
			}
		})
		event.preventDefault();
	})
})

$(function editComment(){
	$(document).on("click", "a.edit_festival", function(event){
		$.get(this.href).success(function(response){
			$("#festival-show").html(response);
		})
		event.preventDefault();
	})
})

//submit edit form
$(document).on("submit", ".edit_festival", function(event){
		form = $(".edit_festival")[0]
		var action = form.action
		$.ajax({
			type: form.method,
			url: form.action,
			data: $(form).serialize(),
			success: function(response){
				$.get(action + ".json").success(function(json){
					$("#festival-show").html();
				})
			}
		})
		event.preventDefault();
	})
