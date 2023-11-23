from app import app
from flask import render_template, request, redirect
import methods



@app.route("/postbook")
def post_book():
    return render_template("postbook.html")
        
@app.route("/sendbook", methods=["POST"])
def send_book():
    username = request.form["username"]
    key = request.form["key"]
    author = request.form["author"]
    title = request.form["title"]
    year = request.form["year"]
    publisher = request.form["publisher"]

    if methods.send_book(username,key,author,title,year,publisher):
        return redirect("/")

@app.route("/")
def get_references():
    books = methods.get_books()
    master = methods.get_master()
    return render_template("index.html", books=books, master=master)

@app.route("/postmaster")
def post_master():
    return render_template("postmaster.html")

@app.route("/sendmaster", methods=["POST"])
def send_master():
    username = request.form["username"]
    key = request.form["key"]
    author = request.form["author"]
    title = request.form["title"]
    school = request.form["school"]
    year = request.form["year"]
    type = request.form["type"]
    address = request.form["address"]
    month = request.form["month"]
    note = request.form["note"]
    annote = request.form["annote"]

    if methods.send_master(username, key, author, title, school, year, type, address, month, note, annote):
        return redirect("/")



    