<html>
<head>
	<title>TEST IO</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				<form role="form" name="frmLogin" id="frmLogin" method="post">
				<div class="form-group">
				    <label>Username:</label>
				    <input type="text" class="form-control" id="username" name="username">
				</div>
				<div class="form-group">
				    <label>Password:</label>
				    <input type="password" class="form-control" id="password" name="password">
				</div>
				<button type="submit" class="btn btn-default btn-primary">Login</button>
				</form>
			</div>
		</div>
</div>


<script type="text/javascript">
	
$(function(){

	var $frmLogin = $('#frmLogin');

	$frmLogin.submit(function(e){
		e.preventDefault();
		var formdata = $(this).serialize();

		// alert(formdata);

		$.ajax({
			url: "db.php?action=login",
			type: "POST",
			dataType: "json",
			data: formdata,
			success: function(data){
				console.log(data);
				if(data.result)
				{
					location.href='dashboard.php';
				}
				else
				{
					alert('Invalid Login');
					return false;
				}
			}
		});
	});

});

</script>

</body>
</html>
