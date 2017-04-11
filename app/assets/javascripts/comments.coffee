# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


`$(function showComments(){
	$("a.show_comments").on("click", function(e){
		$.get(this.href).success(function(json){
			console.log(json)
			$("#comments").append('<h2>' + json.length + ' Comment(s):</h2>')
			json.forEach(function(comment){
				$("#comments").append('<p>' + '<strong>' + comment.username + ' said: </strong>' + comment.content + '</p>');
			})
		})
		e.preventDefault();
	})
})`
