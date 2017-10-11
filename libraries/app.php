<?php

class  App{

    public static $db;
       
	public function __construct($config){
		self::$db = new db_new($config["db"][$config["db"]["type"]]);
	}

	public function start(){
		
            $default = BASE_CONTROLLER;

		if(isset($_GET["c"])){
			$controller = $_GET["c"]."Controller";
		}else{
			$controller = $default;
		}

		if(isset($_GET["a"])){
			$action = $_GET["a"];
		}else{
			$action = "index";
		}

		$c = new $controller;
		if(method_exists($c,$action)){
			$c->$action();
		}else{
			echo "ERROR: $action not found.";
		}
	}

}