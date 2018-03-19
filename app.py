from flask import Flask
from DbOne import Worker, DbOne

db = DbOne("chce_mortfors_rock","ad9693","0n9do10n","pgserver.mah.se")
# db.initialize()
app = Flask(__name__)

worker =  Worker();
@app.route("/")
def home():
    return worker.get_all()

@app.route("/admin")
def admin():
    return "admin"

@app.route("/admin/")
