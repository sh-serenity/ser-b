package main

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/shurcooL/github_flavored_markdown"
	"html/template"
	"net/http"
	"strconv"
)

func comForm(w http.ResponseWriter, r *http.Request) {
	chkn(w,r)
	postid := r.URL.Path[len("/comform/"):]
        i,err := strconv.Atoi(postid)
        if err != nil {
        	fmt.Println(err)
		}
		db := dbConnect()
		var id int
		var username, posttime string
		var post []byte
		row := db.QueryRow("select posts.id, post, username, posttime from posts left join users on posts.owner = users.id where posts.id = ?", i)
		err = row.Scan(&id, &post, &username, &posttime)
		if err != nil {
			fmt.Println(err)
		}
		t, _ := template.ParseFiles("tmpl/comform.html","tmpl/header.html")
		t.Execute(w, nil)
		w.Write(github_flavored_markdown.Markdown(post))
		p2 := &Comformdata2{Postid: id, Pusername: username, Posttime: posttime}
		t2, _ := template.ParseFiles("tmpl/comform2.html")
		t2.Execute(w, p2)
		db.Close()
}

type Comdata struct {
	Id int
	Comment []byte
	Fname, Sname string
	Comtime string
}


func comHandler(w http.ResponseWriter, r *http.Request) {
	chkn(w,r)
	htop(w,r)
	var user User
	user = isauth(w,r)

	db := dbConnect()
		r.ParseForm()
		PostId := r.URL.Path[len("/comment/"):]
		i, err := strconv.Atoi(PostId)
		if err != nil {
			fmt.Println(err)
		}
		var comdata = r.FormValue("comdata")
		var markdown []byte = github_flavored_markdown.Markdown([]byte(comdata))

		result, err := db.Exec("insert into comments (comment, postid, owner) values(?,?,?) ", markdown, i, user.id)
		if err != nil {
			fmt.Println(err)
		}
		var lid int64
		lid, err = result.LastInsertId() // id добавленного объекта
		if err != nil {
			fmt.Println(err)
		}
		fmt.Println(result.RowsAffected())

		row := db.QueryRow("select comment, fname, sname, comtime from comments left join users on comments.owner = users.id where comments.id=? ", lid )
				var fname,sname, comtime string
				var comment []byte
				err = row.Scan(&comment, &fname,&sname, &comtime)
				if err != nil {
					fmt.Println(err)
				}
		//		w.Write(github_flavored_markdown.Markdown(comment))
		//		w.Write(github_flavored_markdown.Markdown([]byte("</div>")))
				w.Write(github_flavored_markdown.Markdown([]byte("<div>")))
				w.Write(github_flavored_markdown.Markdown(comment))
				w.Write([]byte("от: " + fname + " " + sname + ", " + comtime))
				w.Write(github_flavored_markdown.Markdown([]byte("</div>")))


	t, _ := template.ParseFiles("tmpl/footer.html")
	t.Execute(w, nil)

}
