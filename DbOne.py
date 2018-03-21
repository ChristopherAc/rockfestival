
import psycopg2

# connect
# conn = psycopg2.connect(dbname="chce_mortfors_rock", user="ad9693", password="0n9do10n", host="pgserver.mah.se")


# create a cursor
# cursor = conn.cursor()

# execute SQL statement
# cursor.execute("select name from worker")

# get the resultset as a tuple
# result = cursor.fetchall()

# iterate through resultset

# build_tables():
#     cursor.execute('')
class DbOne:

    def __init__ (self, dbname,user,password,host):
        self.dbname = dbname
        self.user = user
        self.password = password
        self.host = host

        self.conn = psycopg2.connect(dbname=self.dbname, user=self.user, password=self.password, host=self.host)
        self.cursor = self.conn.cursor()

    def initialize(self):
        print ('initializing..')
        # Kalla på sql här
    def get_all(self, table):
        self.cursor.execute("select * from {} ".format(table))
        result = self.cursor.fetchall()
        return result

    def get_all_ordered(self,table,attr):
        self.cursor.execute('select * from {} order by ({})'.format(table,attr));
        result = self.cursor.fetchall()
        return result

    def insert_all_into(self,table,*args):
        # print(args)
        # print('insert into {} values {}'.format(table,args))
        self.cursor.execute('insert into {} values {}'.format(table,args))
        self.conn.commit()
# class  Worker:
#
#     def get_all():
#         result = Dbone.cursor.execute("select name from worker")
#         return result
