<?php 
session_start();
?>
<html>
<head>
	<meta charset="utf-8" />
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>TEST IO</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	
	<style type="text/css">
	body {
		margin: 10px;
	}
	</style>
</head>
<body>

<div class="container">
		<div class="row">
			<div class="col-md-12">
			Welcome <?php echo $_SESSION['username'];?>!
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="well">Online Users</div>
				<ul class="list-group" id="users"></ul>
			</div>
			<div class="col-md-6">
				<div class="well" id="messageList"></div>
				<form role="form" name="frmMessage" id="frmMessage" method="post">
				<input type="hidden" name="username" id="username" value="<?php echo $_SESSION['username'];?>">
				<div class="form-group">
				    <label>Message:</label>
				    <textarea class="form-control" id="message" name="message"></textarea>
				    <div id="isTyping" style="font-style: italic; color:#CCC;"></div>
				</div>
				<button type="submit" class="btn btn-default btn-primary">Send Message</button>
				</form>
			</div>
		</div>
</div>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" ></script>
<script src="js/bootstrap.js"></script>
<script src="js/node_modules/socket.io/node_modules/socket.io-client/dist/socket.io.js"></script>
<script src="js/dashboard.js"></script>

</body>
</html>
