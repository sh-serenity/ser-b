package main

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
)
var db *sql.DB
func dbConnect() (db *sql.DB) {
	dbDriver := "mysql"
	dbUser := "$dbuser"
	dbPass := "$dbpass"
	dbHost := "$dbhost"
	dbPort := "3306"
	dbName := "$dbname"
	db, err := sql.Open(dbDriver, dbUser +":"+ dbPass +"@tcp("+ dbHost +":"+ dbPort +")/"+ dbName +"?charset=utf8")
	if err != nil {
		return
	}
	return db
}
