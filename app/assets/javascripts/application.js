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
//= require_tree .




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
		e.preventDefault();
	})
})

$(document).submit("#new_comment", function(event){
	form = $("#new_comment")[0]
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