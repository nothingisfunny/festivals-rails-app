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

$(function appendComment(){
	$("#new_comment").on("submit", function(event){
		$.ajax({
			type: this.method, 
			url: this.action,
			data: $(this).serialize(),
			success: function(response){
				$("#comments").append(response)
				$("#comment_content").val('')
			}
		})
		event.preventDefault();
	})
})