var casper = require('casper').create({
	verbose:true,
	logLevel: "warning",
	pageSettings: {
		userAgent: "Mozilla/5.0 (X11; Linux x86_64)",
		loadImages: true,
		loadPlugins: true,
		webSecurityEnabled: false
	},
	clientScripts: ['jquery-3.3.1.min.js']

});

/*function*/
var config = require("./config.json")
var i;


var term1= config['words'][Math.ceil((Math.random()*9887))]
var term2= config['words'][Math.ceil((Math.random()*9887))]


/*vars*/
var utils = require("utils");
var fs = require('fs');
var xpath = require('casper').selectXPath;
var mouse = require("mouse").create(casper)
var username = casper.cli.get("user")
var password = casper.cli.get("pass")
var search = "https://www.facebook.com/search/pages/?q=" + term1 + " " +  term2;
var waitTime = 4000;

/*Login and such*/

casper.start().thenOpen(config['urls']['loginUrl'], function() {
	console.log(username);
	console.log("Logging in...");
});

casper.then(function(){
	this.evaluate(function(username,password){
		document.getElementById("email").value = username;
		document.getElementById("pass").value = password;
		document.querySelectorAll('input[type="submit"]')[0].click();
	},{
		username : username,
		password : password
	});
});

casper.then(function(){
	this.waitForSelector("#pagelet_composer", function pass(){
		console.log("Logged In Zuccessfully");
		this.capture('login.png');
	}, 10000);
});

casper.thenOpen(search, function _waitAfterStart() {
	casper.wait(waitTime, function() {});
	console.log("Your random search is " + term1+ " " + term2 );
});


casper.then(function(){
		this.capture('search.png');
});

casper.then(function(){
	casper.click("button[data-bt=\'{\"ct\":\"like_page\"}\']");
	casper.wait(waitTime, function() {});
});

casper.then(function(){
		this.capture('search2.png');
});



casper.run(function(){
	this.exit();
});

