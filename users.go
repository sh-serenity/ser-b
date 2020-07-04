package main

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/shurcooL/github_flavored_markdown"
	"html/template"
	"net/http"
	"strconv"
)

func usersHandler(w http.ResponseWriter, r *http.Request) {
	chkn(w,r)
	db := dbConnect()
	htop(w,r)

	var otheruser User
	var oid = r.URL.Path[len("/users/"):]

	i, err := strconv.Atoi(oid)
	if err != nil {
		fmt.Println(err)
	}
	otheruser = signbyid(i)

	f := &filetype{Fname: otheruser.fname, Sname: otheruser.sname, About: otheruser.about}
	t, _ := template.ParseFiles("tmpl/fileview.html")
	t.ExecuteTemplate(w,"View",f)

	rowsp, err := db.Query("select posts.id, post, fname, sname, posttime from posts left join users on posts.owner = users.id where posts.owner = ? order by posttime desc", otheruser.id)
	if err != nil {
		fmt.Println(err)
	}

	for rowsp.Next() {
		var pfname, psname, posttime string
		var post []byte
		var postid int
		err = rowsp.Scan(&postid, &post, &pfname,&psname, &posttime)
		w.Write(github_flavored_markdown.Markdown([]byte("<div>")))
		w.Write(github_flavored_markdown.Markdown(post))
		p := &posttype{Id: postid,Pfname: pfname, Psname: psname, Posttime: posttime}
		t, err:= template.ParseFiles("tmpl/posts.html")
		if err != nil{
				t, _ := template.ParseFiles("tmpl/footer.html")
	t.ExecuteTemplate(w, "footer", nil)
fmt.Println(err)
		}
		t.Execute(w, p)

		c := Comdata{}
		rows, err := db.Query("select comment, fname, sname, comtime from comments left join users on comments.owner = users.id where postid=? order by comtime", postid)
		fmt.Println(postid)
		if err != nil {
			fmt.Println(err)
		}

		for rows.Next() {
			err = rows.Scan(&c.Comment, &c.Fname,&c.Sname, &c.Comtime)
			if err != nil {
				fmt.Println(err)
				continue
			}

			w.Write(github_flavored_markdown.Markdown(c.Comment))
			pc := &Comdata{Fname: c.Fname, Sname: c.Sname, Comtime: c.Comtime}
			tc, err := template.ParseFiles("tmpl/comm.html")
			if err != nil {
				fmt.Println(err)
			}
			tc.Execute(w, pc)

		}
	    w.Write(github_flavored_markdown.Markdown([]byte("</div>")))
	}
	
	t, _ = template.ParseFiles("tmpl/footer.html")
	t.ExecuteTemplate(w, "footer", nil)

}

/*	type leftuser struct {
		Lid       int
		Lusername string
	}
	leftusers := []leftuser{}
	l := leftuser{}
	rowsu, err := db.Query("select id,username from users")
	for rowsu.Next() {
		err = rowsu.Scan(&l.Lid, &l.Lusername)
		if err != nil {
			fmt.Println(err)
			continue
		}
		leftusers = append(leftusers, l)
	}
	err = userstmp.ExecuteTemplate(w, "Index", leftusers)
	if err != nil {
		fmt.Println(err)
	} */