// Hoisting 
// function hoisting() {
// 	console.log(a);
// 	console.log(theFirstHoist());
// 	console.log(theSecondHoist());

// 	var a = "a";
// 	function theFirstHoist() {
// 		return "The first hoist";
// 	}
// 	var theSecondHoist = function() {
// 		return "The second hoist";
// 	}
// }

// function hoisting() {
// 	var a;
// 	function theFirstHoist() {
// 		return "The first hoist";
// 	}
// 	var theSecondHoist;
// 	console.log(a);
// 	console.log(theFirstHoist());
// 	console.log(theSecondHoist());

// 	a = "a";
	
// 	theSecondHoist = function() {
// 		return "The second hoist";
// 	}
// }


// hoisting()
// // undefined
// // "The first hoist"
// // TypeError

// This
// var name = "John Frusciante" 
// var artist = {
// 	name: "Taylor Swift",
// 	properties: {
// 		name: "Elvis Presley",
// 		getArtistsName: function() {
// 			return this.name;
// 		}
// 	}
// }

// console.log(artist.properties.getArtistsName()); // "Elvis Presley"
// var artistsName = artist.properties.getArtistsName;
// console.log(artistsName()); // John Fruscante





