<html>
<head><title>CS143 Project 1A Web Query</title></head>

<body>
	<b>Author: Tongtong Xu, Jiajun Zhu</b>
<p>Please do not run a complex query here. You may kill the server. </p>
Type an SQL query in the following box: <p>
Example: <tt>SELECT * FROM Actor WHERE id=10;</tt><br />
<p>
<form action="query.php" method="get">
<textarea name="query" cols="60" rows="8"><?= isset($_GET["query"])?$_GET["query"]:'' ?></textarea>
<input type="submit" value="Submit" />
</form>
</p>


<?php
	$db_connection = mysql_connect("localhost", "cs143", "");
	if(!$db_connection){
		die('Not connected : ' . mysql_error());
	}
	echo 'Connected successfully';
	echo '<br/>';
	
	$db_selected = mysql_select_db("CS143", $db_connection);
	if(!$db_selected){
		die('Can\'t use CS143 : ' . mysql_error());
	}
	echo 'Connected to CS143!';
	echo '<br/>';

	if($_GET["query"]){
		ini_set('display_errors', 0);
		$query = $_GET["query"];

		$query = str_replace(array("\r", "\n"), " ", $query);
		//$query = mysql_escape_string($_GET["query"], $db_connection);
		if($query){
			$san_que = mysql_real_escape_string($query, $db_connection);
			$rs = mysql_query($san_que, $db_connection);
			while($row = mysql_fetch_row($rs)){
				foreach ($row as $attr) {
					# code...
					echo $attr." ";
				}
				echo "<br/>";
			}
		}
	}

	mysql_close($db_connection);



?>
</body>
</html>
