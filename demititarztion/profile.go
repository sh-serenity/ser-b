package main

import (
	"fmt"
	"html/template"
	"net/http"
	"strconv"
)

type filetype struct {
	Fname string
	Sname string
	About string
}

func fileform(w http.ResponseWriter, r *http.Request) {
	chknon(w,r)
	db := dbConnect()
	htop(w, r)
	var user User
	user = isauth(w, r)
    f := &filetype{Fname: user.fname, Sname: user.sname, About: user.about}
    t, _ := template.ParseFiles("tmpl/fileform.html")
    t.ExecuteTemplate(w,"form",f)
	db.Close()
	t, _ = template.ParseFiles("tmpl/footer.html")
	t.ExecuteTemplate(w, "footer", nil)
}

func filesave(w http.ResponseWriter, r *http.Request) {
	chknon(w,r)
	var user User
	user = isauth(w, r)
	db = dbConnect()
	result, err := db.Exec("update users set fname=?, sname=?, about=? where id=?", r.FormValue("fname"), r.FormValue("sname"), r.FormValue("about"), user.id)
	if err !=  nil {
		fmt.Println(err)
	}
	fmt.Println(result.RowsAffected())
	db.Close()
	http.Redirect(w, r, "/home", 301)
}

func fileview(w http.ResponseWriter, r *http.Request) {
	htop(w, r)
	var otheruser User
	var oid = r.URL.Path[len("/fileview/"):]
	i, err := strconv.Atoi(oid)
	if err != nil {
		fmt.Println(err)
	}
	otheruser = signbyid(i)
	f := &filetype{Fname: otheruser.fname, Sname: otheruser.sname, About: otheruser.about}
	t, _ := template.ParseFiles("tmpl/fileview.html")
	t.ExecuteTemplate(w,"view",f)
	t, _ = template.ParseFiles("tmpl/footer.html")
	t.ExecuteTemplate(w, "footer", nil)

}
