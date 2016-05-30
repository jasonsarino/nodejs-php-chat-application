var socket = io.connect( 'http://localhost:8080' );
var $users = $('#users');
var $messageList = $('#messageList');
var $username = $('#username');
var $message = $('#message');
var $onlineMembers = $('.onlineMembers');

var $frmMessage = $('#frmMessage');

$frmMessage.submit(function(e){
	e.preventDefault();
	var formdata = $(this).serialize();
	

	socket.emit( 'sendMessage', { username: $username.val(), message: $message.val() } );


	$.ajax({
		url: "db.php?action=insertMessage",
		type: "POST",
		data: formdata,
		success: function(data){
		}
	});

	$message.val('');
});

socket.on('new message', function(data){
	$messageList.append("<strong>" + data.username + "</strong>: " + data.message + "<br>");
});

socket.on('getOnlineMembers', function(data){
	var html = "";
	for(i = 0; i < data.length; i++)
	{
		html += "<li class='list-group-item onlineMembers' style='cursor: pointer;' onClick=\"getMessage('" + data[i] +"')\" >" + data[i] + "</li>";
	}
	$users.html(html);
});


socket.emit('new user', $username.val(), function(data){});

function getMessage(username)
{
	$('#messageList').html('');

	$.ajax({
		url: "db.php?action=getMessage",
		type: "POST",
		data: { username: username },
		dataType: "json",
		success: function(data){
			$.each(data, function(index) {
			    $('#messageList').append('<strong>' + data[index].name + '</strong>: ' + data[index].message + '<br>');
			});
		}
	});
}





socket.on('typing', function(data){
	// $('#isTyping').html(data.username + " is typing...");
	$('#message').attr("placeholder", data.username + " is typing...");
});



//setup before functions
var typingTimer;                //timer identifier
var doneTypingInterval = 2500;  //time in ms, 5 second for example
var $input = $('#message');

//on keyup, start the countdown
$input.on('keyup', function () {
  clearTimeout(typingTimer);
  socket.emit('is typing', {username: $('#username').val()});
  typingTimer = setTimeout(doneTyping, doneTypingInterval);

});

//on keydown, clear the countdown 
$input.on('keydown', function () {
  clearTimeout(typingTimer);
});

//user is "finished typing," do something
function doneTyping () {
  //do something
  socket.emit('stopTyping', {username: $('#username').val()});
}

socket.on('stopTypingText', function(data){
	// $('#isTyping').html(data.username + " is typing...");
	$('#message').attr("placeholder", "");
});
