<?php

	if (isset($page) && $page == "login") {
		include_once 'login-header.php';
	} else {
		include_once 'header.php';
	}
	
	
	
	if (isset($page) && $page != "") {
		include($page . '.php');
	} else {
		include('main.php');
		}
	
	include_once 'footer.php';		

?>