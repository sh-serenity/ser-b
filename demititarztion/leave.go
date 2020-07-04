package main

import (
	_ "github.com/go-sql-driver/mysql"
	"net/http"
)
func leaveHandler(w http.ResponseWriter, r *http.Request) {
	chknon(w,r)
	session, _ := store.Get(r, "cookie-name")

	// Revoke users authentication
	session.Values["authenticated"] = false
	session.Save(r, w)
	http.Redirect(w,r,"/",301)
}
