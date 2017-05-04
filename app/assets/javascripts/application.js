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
//= require handlebars
//= require_tree .

//create object for festival
function Festival(attributes){
	this.name = attributes.name
	this.id = attributes.id
	this.category = attributes.category
	this.location = attributes.location
	this.venue = attributes.venue
	this.line_up = attributes.line_up
	this.start = attributes.start
	this.end = attributes.end
	this.website = attributes.website
	this.creator_id = attributes.creator_id
	this.world_part = attributes.world_part
	this.when = attributes.when
}
$(function(){
	Festival.templateSource = $("#festival-template").html();
	Festival.template = Handlebars.compile(Festival.templateSource);
})

Festival.prototype.renderShow = function(){
	return Festival.template(this)
}


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
var commentsCount = 0; 
$(function showComments(){
	$(document).on("click", "a.show_comments", function(e){
		$.get(this.href).success(function(json){
			commentsCount = json.length
			$("#comments-count").append('<h2>' + commentsCount + ' Comment(s):</h2>')
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
				$("#comments-count").html( '<h2>' + (commentsCount + 1) + ' Comment(s):</h2>')
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
		var form = $(".edit_festival")[0]
		var values = $(this).serialize()
		$.ajax({
			method: "patch",
			url: form.action,
			data: JSON.stringify($(this).serialize()),
			dataType: "json",
			success: function(json){
				var festival = new Festival(json);
				console.log(json)
				var showPage = festival.renderShow(this);
				console.log(showPage)
				$("#festival-show").html(showPage);
			}
		})
	event.preventDefault();
})
		
// Update Attend/Unattend status

$(document).on("click", "button.attend", function(event){
	event.preventDefault();
	var user_id = $("#current-user-id")[0].innerHTML
	var festival_id = $('#festival-id')[0].innerHTML
	var attend = $("button.attend")[0].innerHTML === "Attend"
	if (attend === true){
		$.ajax({
			method: "post",
			url:'/attend',
			data: {user_id: user_id, festival_id: festival_id, action: 'create'},
			success: function(response){
				console.log(response)
			}
		})
	} else {
		$.ajax({
			method: "delete",
			url: '/attend',
			data: {user_id: user_id, festival_id: festival_id, action: 'delete'},
			success: function(response){
				console.log(response)
			}
		})
	}
		
})
