var socket = require( 'socket.io' );
var express = require( 'express' );
var http = require( 'http' );

var app = express();
var server = http.createServer( app );

var io = socket.listen( server );

users = [];
connections = [];

server.listen( 8080 );
console.log('server running...');

io.sockets.on( 'connection', function( socket ) {

	connections.push('socket');
	console.log('Connected: %s sockets connected', connections.length);

	// Disconnect
	socket.on('disconnect', function(data){
		// if( ! socket.username) return;
		users.splice(users.indexOf(socket.username), 1);
		updateUsernames();
		connections.splice(connections.indexOf(socket), 1);
		console.log('Disconnected %s sockets connected', connections.length);
	});

	// Send messahe
	socket.on('sendMessage', function(data){
		// console.log(data);
		io.sockets.emit('new message', {username: data.username, message: data.message});
	});

	socket.on('new user', function(data, callback){
		callback(true);
		socket.username = data;
		users.push(socket.username);
		updateUsernames();
	});

	socket.on('is typing', function(data){
	 	io.sockets.emit('typing', {username: data.username});
	});

	socket.on('stopTyping', function(data){
	 	io.sockets.emit('stopTypingText', {username: data.username});
	});

	function updateUsernames()
	{
		io.sockets.emit('getOnlineMembers', users);
	}

});





