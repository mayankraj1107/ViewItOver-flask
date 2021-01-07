from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
import os
import math
from werkzeug import secure_filename
from datetime import datetime
from flask_mail import Mail

import json

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = params['local_server']

app = Flask(__name__)

app.secret_key = "ravenclaw"

app.config['UPLOAD_FOLDER'] = params['upload_location']

app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail_user'],
    MAIL_PASSWORD=params['gmail_password']
)

mail = Mail(app)

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['pod_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    ph_no = db.Column(db.String(10),  nullable=False)
    mssg = db.Column(db.String(120),  nullable=False)
    date = db.Column(db.String(12), nullable=True)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(30), nullable=False)
    content = db.Column(db.String(200),  nullable=False)
    tagline = db.Column(db.String(30),  nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)


@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(params['no_of_post']))
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page = int(page)
    posts = posts[(page - 1) * int(params['no_of_post']):(page - 1)
                  * int(params['no_of_post']) + int(params['no_of_post'])]
    if page == 1:
        prev = "#"
        nexte = "/?page=" + str(page + 1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        nexte = "#"
    else:
        prev = "/?page=" + str(page - 1)
        nexte = "/?page=" + str(page + 1)
    return render_template('index.html', params=params, posts=posts, nexte=nexte, prev=prev)


@ app.route('/about')
def about():
    return render_template('about.html', params=params)


@ app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.filter_by().all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        pasword = request.form.get('pass')
        if username == params['admin_user'] and pasword == params['admin_password']:
            session['user'] = username
            posts = Posts.query.filter_by().all()
            return render_template('dashboard.html', params=params, posts=posts)

    return render_template('login.html', params=params)


@ app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@ app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


@ app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(
                app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Upload Successfull !!"


@ app.route('/edit/<string:sno>', methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            ed_title = request.form.get('title')
            ed_slug = request.form.get('slug')
            ed_content = request.form.get('content')
            ed_tagline = request.form.get('tagline')
            ed_img_file = request.form.get('img_file')
            date = datetime.now()

            if sno == '0':
                post = Posts(title=ed_title, slug=ed_slug, content=ed_content,
                             tagline=ed_tagline, img_file=ed_img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = ed_title
                post.slug = ed_slug
                post.content = ed_content
                post.tagline = ed_tagline
                post.img_file = ed_img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)
        post = Posts.query.filter_by(sno=sno)
        return render_template('edit.html', params=params, sno=sno, post=post)


@ app.route('/delete/<string:sno>', methods=['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@ app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        # add entry to the database
        name = request.form.get('name')
        email = request.form.get('email')
        ph_num = request.form.get('ph_num')
        mssg = request.form.get('mssg')
        entry = Contacts(name=name, email=email, ph_no=ph_num,
                         mssg=mssg, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from' + name,
                          sender=email,
                          recipients=[params['gmail_user']],
                          body=mssg + "\n" + ph_num
                          )
    return render_template('contact.html',  params=params)

app.run(debug=True)
