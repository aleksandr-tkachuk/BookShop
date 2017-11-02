<?php

define('BASE_PASS', realpath(__DIR__ . '/..') . '/');

define("TYPE_DB", "mysql");

$config = [
	"db" => [
		"type" => TYPE_DB,
		"mysql" => [
			"driver" => "mysql",
			"host" => "mysqldump",
			"username" => "root",
			"password" => "root",
			"dbname" => "bookShop",
			"charset" => "utf8"
		],
		"postgre" => [
			"driver" => "pgsql",
			"host" => "localhost",
			"username" => "postgres",
			"password" => "123456",
			"dbname" => "newbookshop",
		],
	],
    "api" => [
        "defaultResponseFormat" => "json"
    ]
];

