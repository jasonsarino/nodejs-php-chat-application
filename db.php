<?php 
session_start();
$db = mysqli_connect("localhost","root","","chatroom");


if($_GET['action'] == "login")
{

	$username = $_REQUEST['username'];
	$password = md5($_REQUEST['password']);

	$sql = mysqli_query($db, "SELECT * FROM `users` WHERE `username` = '".$username."' AND `password` = '".$password."'");
	if(mysqli_num_rows($sql) == 1)
	{
		$_SESSION['username'] = $username;
		$result = array('result' =>	TRUE);
	}
	else
	{
		$result = array('result' =>	FALSE);
	}

	echo json_encode($result, TRUE);
}

if($_GET['action'] == "insertMessage")
{
	$username = $_REQUEST['username'];
	$message = $_REQUEST['message'];

	$sql = mysqli_query($db, "INSERT INTO messages(name, message, createdDate) values('".$username."','".$message."','".date("Y-m-d")."')");
}

if($_GET['action'] == "getMessage")
{
	$username = $_REQUEST['username'];

	$messages = array();
	$sql = mysqli_query($db, "SELECT * FROM messages");
	while($rs = mysqli_fetch_array($sql))
	{
		$messages[] = $rs;
	}
	echo json_encode($messages, TRUE);
}

?>