from flask import Flask, render_template, redirect, request
from DbOne import DbOne

db = DbOne("chce_mortfors_rock","ad9693","0n9do10n","pgserver.mah.se")
# db.initialize()
app = Flask(__name__)


@app.route("/")
def home():
    pass

@app.route("/band")
def band():
    # TODO Band ska länkas i URL och sen hämtas.
    # TODO Även info om medlemmarna ska hämtas.
    pass

@app.route("/admin")
def admin():
    return "admin"
    # TODO Login

@app.route("/admin/workers")
# TODO Lägga till Användare.
# EXTRA add indication of contact and security

def workers():
    workers = db.get_all('worker')
    return render_template('workers.html',workers=workers)

@app.route("/admin/workers/<sorting>")
def workers_sorted(sorting):
    workers = db.get_all_ordered('worker',sorting)
    print(sorting)
    return render_template('workers.html',workers=workers)

@app.route('/admin/workers/add_worker',methods=['POST','GET'])
def workers_add():
    result = request.form
    # print("{},{},{}".format(personid,name,address))
    print(result['personid'])
    db.insert_all_into('worker',result['personid'],result['name'],result['address'])
    # redirect('/admin/work')
    return redirect('/admin/workers')

@app.route('/admin/bands')
    # TODO lägga till, ta bort band
    # TODO lägga till, ta bort medlemmar från bands
def admin_bands():
    pass

@app.route('admin/spelningar'):
    # TODO

@app.route("/admin/contacts")
def contacts():
    return render_template('workers.html',workers=workers)

@app.route("/admin/security")
# TODO hämta scener och vem som ansvarar under spelningar.
def security():
    pass
