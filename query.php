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
	if($_GET["query"]){
		ini_set('display_errors', 0);
		$query = $_GET["query"];
		if(preg_match("/^\s*select/i", $query) or preg_match("/^\s*show/i", $query)){
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
			echo '<br/>';

			$rs = mysql_query($query, $db_connection);
			if(mysql_errno()){
				echo mysql_error()."<br>";
			}else{
				echo 'Result is shown as follows: ';
				echo '<br/>';
				$num = mysql_num_fields($rs);
				echo "<table border = 1>";

				for ($index=0;$index<$numfields;$index++){
					echo "<th>".mysql_field_name($rs,$index)."</th>";
				}
	
				while($row = mysql_fetch_row($rs)){
					echo "<tr>";
					foreach ($row as $attr) {
						# code...
						echo "<td align='center'>".$attr."</td>";
					}
					echo "<tr/>";
				}
				echo "</table>";
			}
			mysql_close($db_connection);
		}
	}
?>
</body>
</html>
