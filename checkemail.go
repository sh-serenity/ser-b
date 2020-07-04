package main

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"net/http"
)


func checkemail(w http.ResponseWriter, r *http.Request) {
	chksoap(w,r)
	db := dbConnect()
	hash := r.URL.Path[len("/checkemail/"):]
	fmt.Println(hash)
	row := db.QueryRow("SELECT count(*) FROM hashes where hash = ?", hash)
	var count int
	err := row.Scan(&count)
	if err != nil {
		fmt.Println(err)
	}
	if count > 0 {
		row := db.QueryRow("select email, password, fname, sname from hashes where hash = ?", hash)
		var email, password, fname, sname string
		err := row.Scan(&email, &password, &fname, &sname)
		if err != nil {
		fmt.Println(err)
		}
		var ucount int
		ucount = 0
		uerr := db.QueryRow("select COUNT(*) from users where username = ?", email).Scan(&ucount)
		fmt.Printf("Number of rows are %d\n", ucount)
		if uerr != nil {
			fmt.Println(uerr)
		}
        if ucount == 0 {
			result, err := db.Exec("insert into users (username, password,fname,sname) values(?,?,?,?)", email, password, fname, sname)
			if err != nil {
				fmt.Println(err)
			}
			fmt.Println(result.LastInsertId()) // id добавленного объекта
			fmt.Println(result.RowsAffected())

			result, err = db.Exec("delete from hashes where email = ?", email)
			if err != nil {
				fmt.Println(err)
			}
			fmt.Println(result.LastInsertId()) // id добавленного объекта
			fmt.Println(result.RowsAffected())
			http.Redirect(w, r, "/enter", 301)
		}
	}
}
