import os
from flask import Blueprint, render_template, redirect, url_for, request, flash
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import login_user, logout_user, login_required, current_user
from .models import User
from . import db

auth = Blueprint('auth', __name__)


@ auth.route("/login")
def login():
    if current_user.is_authenticated:
        return redirect(url_for('main.dashboard'))

    return render_template("login.html")


@ auth.route('/login', methods=['POST'])
def login_post():
    email = request.form.get('email')
    password = request.form.get('password')

    user = User.query.filter_by(email=email).first()

    if not user or not check_password_hash(user.password, password):
        flash('Email atau Password salah')
        return redirect(url_for('auth.login'))

    login_user(user)

    return redirect(url_for('main.dashboard'))


@ auth.route('/signup')
def signup():
    if current_user.is_authenticated:
        return redirect(url_for('main.dashboard'))

    return render_template('signup.html')


@ auth.route('/signup', methods=['POST'])
def signup_post():
    name = request.form.get('name')
    telp = request.form.get('telp')
    email = request.form.get('email')
    password = request.form.get('password')
    repassword = request.form.get('repassword')

    user = User.query.filter_by(email=email).first()

    admin = User.query.filter_by(level='1').first()
    if not admin:
        level = "1"
    else:
        level = "5"

    if user:
        flash('Email telah digunakan')
        return redirect(url_for('auth.signup'))

    if password != repassword:
        flash(u'Password berbeda', 'pass-error')
        return redirect(url_for('auth.signup'))

    new_user = User(email=email, nama=name, telp=telp, password=generate_password_hash(password, method='sha256'), level=level)

    db.session.add(new_user)
    db.session.commit()

    return redirect(url_for('auth.login'))


@ auth.route('/logout')
@ login_required
def logout():
    logout_user()
    return redirect(url_for('main.home'))


@ auth.route("/input-data/data-user")
@ login_required
def input_data_user():
    active = 'active'
    foto = current_user.foto

    page = request.args.get('page', default = 1, type = int)
    per_page = 10

    data = User.query.count()
    ldata = 10*page
    fdata = ldata-9
    if data < ldata:
        ldata = data

    all_data = User.query.paginate(page,per_page,error_out=False)

    return render_template("input-data-user.html", foto=foto, name=current_user.nama, level=current_user.level, input_data_user_navbar=active, user=all_data, page=page, data=data, fdata=fdata, ldata=ldata)


@ auth.route("/input-data/data-user/add", methods=['POST'])
@ login_required
def input_data_user_add():
    if request.method == 'POST':
        nama = request.form['name']
        email = request.form['email']
        telp = request.form['telp']
        password = request.form['password']
        repassword = request.form['repassword']
        level = request.form['level']

        user = User.query.filter_by(email=email).first()

        if user:
            flash('Penambahan dibatalkan. Email telah digunakan')
            return redirect(url_for('auth.input_data_user'))

        if password != repassword:
            flash(u'Penambahan dibatalkan. Password berbeda', 'pass-error')
            return redirect(url_for('auth.input_data_user'))

        add_Data = User(nama=nama, email=email, telp=telp, password=generate_password_hash(password, method='sha256'), level=level)

        db.session.add(add_Data)
        db.session.commit()
        flash("Data berhasil ditambahkan")

        return redirect(url_for('auth.input_data_user'))


@ auth.route("/input-data/data-user/update", methods=['GET', 'POST'])
@ login_required
def input_data_user_update():
    if request.method == 'POST':
        update = User.query.get(request.form.get('id'))
        update.nama = request.form['name']
        update.email = request.form['email']
        update.telp = request.form['telp']
        update.level = request.form['level']

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('auth.input_data_user'))


@ auth.route("/input-data/data-user/delete", methods=['GET', 'POST'])
@ login_required
def input_data_user_delete():
    id = request.form['id']
    delete = User.query.get(id)

    db.session.delete(delete)
    db.session.commit()
    flash("Data berhasil dihapus")

    return redirect(url_for('auth.input_data_user'))


@ auth.route("/profil/me/update-profil", methods=['GET', 'POST'])
@ login_required
def update_data_profile_user():
    if request.method == 'POST':
        update = User.query.get(request.form.get('id'))
        update.nama = request.form['name']
        update.telp = request.form['telp']

        db.session.commit()
        flash("Data berhasil diubah")

        return redirect(url_for('main.profil_me'))


@ auth.route("/profil/me/update-pass-profil", methods=['GET', 'POST'])
@ login_required
def update_pass_profile_user():
    if request.method == 'POST':
        update = User.query.get(request.form.get('id'))
        password = request.form['password']

        repassword = request.form['repassword']
        if password != repassword:
            flash(u'Perubahan dibatalkan. Password berbeda', 'pass-error')
            return redirect(url_for('main.profil_me'))

        update.password = generate_password_hash(password, method='sha256')

        db.session.commit()
        flash("Password berhasil diubah")

        return redirect(url_for('main.profil_me'))


@ auth.route("/profil/me/update-foto-profil", methods=['GET', 'POST'])
@ login_required
def update_foto_profile_user():
    if request.method == 'POST':
        foto = request.files['fp']
        extfile = foto.filename.rsplit('.', 1)[1].lower()

        update = User.query.get(request.form.get('id'))

        dir = 'app/static/img/uploaded_images/users'
        if update.foto:
            os.remove(os.path.join(dir, update.foto))

        update.foto = "{}_usersimg.{}".format(update.id_users, extfile)
        db.session.commit()

        foto.save(os.path.join(dir, "{}".format(update.foto)))

        flash("Foto profil berhasil diubah")

        return redirect(url_for('main.profil_me'))