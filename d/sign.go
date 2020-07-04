package main

import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/shurcooL/github_flavored_markdown"
	"html/template"
	"net/http"
)
//var store = sessions.NewCookieStore([]byte(os.Getenv("SESSION_KEY")))


func secret(w http.ResponseWriter, r *http.Request) {
	session, _ := store.Get(r, "cookie-name")

	// Revoke users authentication
	session.Values["authenticated"] = false
	session.Save(r, w)
	http.Redirect(w,r,"/",301)
}

func signinname(username string) (User) {
	db := dbConnect()
	var user User
	row := db.QueryRow("select id, username, fname, sname, about, userpic, time from users where username = ?", username)
	err := row.Scan(&user.id, &user.username, &user.fname,&user.sname, &user.about, &user.userpic, &user.timereg)
	if err != nil {
		fmt.Println(err)
	}
	db.Close()
	return user
}
func signbyid(i int) (User) {
	db := dbConnect()
	var user User
	row := db.QueryRow("select id, username, fname, sname, about, userpic, time from users where id = ?", i)
	err := row.Scan(&user.id, &user.username, &user.fname,&user.sname, &user.about, &user.userpic, &user.timereg)
	if err != nil {
		fmt.Println(err)}
	db.Close()
	return user
}
type link struct {
	Title string
	Url string
}

//var sessionid string

var userstmp = template.Must(template.ParseFiles("tmpl/users.html"))
var tmpl = template.Must(template.ParseFiles("tmpl/comments.html"))
func signHandler(w http.ResponseWriter, r *http.Request) {
	chknon(w,r)
	session, _ := store.Get(r, "cookie-name")

	session.Values["authenticated"] =  false
	db := dbConnect()
	session.Save(r, w)
	//	if auth, ok := session.Values["authenticated"].(bool); !ok || !auth {
	r.ParseForm()
	var user User
	var username = r.FormValue("login")
	var password = r.FormValue("password")
	row := db.QueryRow("select id, username, fname, sname, about, userpic, time from users where username = ? and password=MD5(?)", username, password)
	err := row.Scan(&user.id, &user.username, &user.fname, &user.sname, &user.about, &user.userpic, &user.timereg)
	if err == nil {
		fmt.Println(err)
	}
	if   user.id != 0  {
		 session.Values["userid"] = user.id
		 session.Values["authenticated"] = true
		 session.Save(r, w)
		 http.Redirect(w,r,"/home",301)
	 }

	if auth, ok := session.Values["authenticated"].(bool); !ok || !auth {
		tmp := &tmp{Title: "Ошибка",Note:"Или произошла страшная ошибка, или пользователя с такими данными не существует."}
		t, _ := template.ParseFiles("tmpl/tmp.html","tmpl/header.html","tmpl/footer.html")
		t.ExecuteTemplate(w, "tmp",tmp)

	 }
//	Home(w,r)
	db.Close()
}


type leftuser struct {
	Lid            int
	Lfname, Lsname string
}
var htmp = template.Must(template.ParseFiles("tmpl/rheader.html"))
func rlusers(w http.ResponseWriter, r *http.Request) {
	db := dbConnect()
	leftusers := []leftuser{}
	l := leftuser{}
	rowsu, err := db.Query("select id, fname, sname from users")
	for rowsu.Next() {
		err = rowsu.Scan(&l.Lid, &l.Lfname, &l.Lsname)
		if err != nil {
			fmt.Println(err)
			continue
		}
		leftusers = append(leftusers, l)
	}
	err = htmp.ExecuteTemplate(w, "Index", leftusers)
	if err != nil {
		fmt.Println(err)
	}
	db.Close()
}




func isauth(w http.ResponseWriter, r *http.Request) (User) {
	session, _ := store.Get(r, "cookie-name")
	var user User
	if auth, ok := session.Values["authenticated"].(bool); !ok || !auth {
//		t, _ := template.ParseFiles("tmpl/nologin.html","tmpl/header.html","tmpl/footer.html")
//		t.ExecuteTemplate(w,"nologin", nil)
		http.Redirect(w,r,"/",302)
	} else {
		userid := session.Values["userid"].(int)
		user = signbyid(userid)
	}
	return user
}

func htop(w http.ResponseWriter, r *http.Request) {

	var user User
		user = isauth(w,r)
	/*	t,err := template.ParseFiles("tmpl/header.html")
		if err != nil {
			fmt.Println(err)
		}
		t.ExecuteTemplate(w,"header", nil) */
	db := dbConnect()
	leftusers := []leftuser{}
	l := leftuser{}
	rowsu, err := db.Query("select id, fname, sname from users")
	for rowsu.Next() {
		err = rowsu.Scan(&l.Lid, &l.Lfname, &l.Lsname)
		if err != nil {
			fmt.Println(err)
			continue
		}
		leftusers = append(leftusers, l)
	}
	err = htmp.ExecuteTemplate(w, "Index", leftusers)
	if err != nil {
		fmt.Println(err)
	}
		links := []link{}
		links = append(links,link{"Домой","/home/"})
		links = append(links,link{"Почитать посты","/posts/"})
		links = append(links,link{"Написать пост","/postform/"})
		links = append(links,link{"Профиль " + user.fname,"/profile/"})
		links = append(links,link{"Выйти","/exit/"})

		t,err := template.ParseFiles("tmpl/menu.html")
		if err != nil {
			fmt.Println(err)
		}
		t.ExecuteTemplate(w,"menu", links)
   	//	rlusers(w,r)

}
func Home(w http.ResponseWriter, r *http.Request) {
	db := dbConnect()


	htop(w, r)
	var user User
	user = isauth(w, r)


	rowsp, err := db.Query("select posts.id, post, fname, sname, posttime from posts left join users on posts.owner = users.id where posts.owner = ? order by posttime desc", user.id)
	if err != nil {
		fmt.Println(err)
	}

	for rowsp.Next() {
		var pfname, psname, posttime string
		var post []byte
		var postid int
		err = rowsp.Scan(&postid, &post, &pfname, &psname, &posttime)
		w.Write(github_flavored_markdown.Markdown([]byte("<div>")))
		w.Write(github_flavored_markdown.Markdown(post))
		p := &posttype{Id: postid, Pfname: pfname, Psname: psname, Posttime: posttime}
		t, err := template.ParseFiles("tmpl/posts.html")
		if err != nil {
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
			err = rows.Scan(&c.Comment, &c.Fname, &c.Sname, &c.Comtime)
			if err != nil {
				fmt.Println(err)
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
//		fmt.Println(w,"</div>")


		/*
			comments := []commtype{}
			c := commtype{}
			rows, err := db.Query("select comment, username, comtime from comments left join users on comments.owner = users.id where postid=? order by comtime", postid)
			fmt.Println(postid)
			if err != nil {
				fmt.Println(err)
			}

			for rows.Next() {
				err = rows.Scan(&c.Comment, &c.Username, &c.Comtime)
				if err != nil {
					fmt.Println(err)
					continue
				}
				comments = append(comments, c)
			}
			err = tmpl.ExecuteTemplate(w, "Index", comments)
			if err != nil {
				fmt.Println(err)
			}
		*/
		//	session.Values["userid"] = user.id
		//	session.Values["authenticated"] = true
		//	session.Save(r, w)
		db.Close()
		t, _ := template.ParseFiles("tmpl/footer.html")
		t.ExecuteTemplate(w, "footer", nil)

}
