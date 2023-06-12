from typing import Union
from fastapi import FastAPI,Response,Request,HTTPException
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import sqlite3

app = FastAPI()

app.add_middleware(
	CORSMiddleware,
	allow_origins=["*"],
	allow_credentials=True,
	allow_methods=["*"],
	allow_headers=["*"],
)


@app.get("/")
def read_root():
 return {"Hello": "World"}

@app.get("/peminjam/{id}")
def get_Peminjam(id:str):
    DB_NAME = "lendy1.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    
    # Fetch the student name from the database based on the id
    cur.execute("SELECT * FROM peminjam WHERE id = ?", (id))
    result = cur.fetchone()
    
    con.close()
    
    if result:
        username = result[1]
        wallet = result[5]
        return {"id": id, "username": username, "wallet" : wallet}
    else:
        return {"error": "User not found"}

# panggil sekali saja
@app.get("/init/")
def init_db():
    try:
        DB_NAME = "lendy1.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        create_table_umkm = """ CREATE TABLE umkm(
                id          INTEGER PRIMARY KEY AUTOINCREMENT,
                nama        TEXT NOT NULL,
                alamat      TEXT NOT NULL,
                kategori    TEXT NOT NULL,
                omset       DOUBLE NOT NULL,
                id_pem      INTEGER,
                FOREIGN KEY (id_pem) REFERENCES peminjam(id)
            )  
        """
        cur.execute(create_table_umkm)
        con.commit()
    except Exception as e:
        print("Error:", str(e))
        return {"status": "Terjadi error"}
    finally:
        con.close()

    return {"status": "Ok, database dan tabel berhasil dibuat"}



from pydantic import BaseModel

class Pem(BaseModel):
   username: str
   email: str
   password: str

class PemLogin(BaseModel):
   email: str
   password: str

class Umkm(BaseModel):
   nama: str
   alamat: str
   kategori: str
   omset: float
   id_pem: int

#status code 201 standard return creation
#return objek yang baru dicreate (response_model tipenya Pem)
@app.post("/tambah_peminjam/", response_model=Pem,status_code=201)  
def tambah_peminjam(p: Pem,response: Response, request: Request):
   try:
    DB_NAME = "lendy1.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
    cur.execute("""insert into peminjam (username, email, password) values ( "{}","{}","{}")""".format(p.username, p.email, p.password))
    con.commit()
   except:
    return ({"status":"terjadi error"})   
   finally:   
    con.close()
   # tambah location di header
   response.headers["location"] = "/peminjam/{}".format(p.username) 
   return p

@app.post("/tambah_umkm/", response_model=Umkm,status_code=201)  
def tambah_umkm(p: Umkm,response: Response, request: Request):
   try:
    DB_NAME = "lendy1.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    # hanya untuk test, rawan sql injection, gunakan spt SQLAlchemy
    cur.execute("""insert into umkm (nama, alamat, kategori, omset, id_pem) values ( "{}","{}","{}", {}, {})""".format(p.nama, p.alamat, p.kategori, p.omset, p.id_pem))
    con.commit()
   except:
    return ({"status":"terjadi error"})   
   finally:   
    con.close()
   # tambah location di header
   response.headers["location"] = "/umkm/{}".format(p.nama) 
   return p

@app.get("/umkm/count/{id_pem}")
def count_umkm(id_pem: int):
    DB_NAME = "lendy1.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()

    # Count the number of Umkm records based on the id_pem
    cur.execute("SELECT COUNT(*) FROM umkm WHERE id_pem = ?", (id_pem,))
    result = cur.fetchone()[0]

    con.close()

    return {"id_pem": id_pem, "umkm_count": result}

@app.get("/tampilkan_semua_peminjam/")
def tampil_semua_peminjam():
   try:
    DB_NAME = "lendy1.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    recs = []
    for row in cur.execute("select * from peminjam"):
        recs.append(row)
   except Exception as e:
    print("Error: ", str(e))
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
   return {"data":recs}


def get_user_id(email):
    connection = sqlite3.connect('lendy1.db')
    cursor = connection.cursor()

    # Retrieve the user ID based on the email
    cursor.execute("SELECT id FROM peminjam WHERE email = ?", (email,))
    result = cursor.fetchone()

    cursor.close()
    connection.close()

    if result:
        return result[0]  # Return the first column value (user ID)
    else:
        return None  # If user is not found, return None or handle the case accordingly

def authenticate_user(email: str, password: str):
    # Connect to the SQLite database
    conn = sqlite3.connect("lendy1.db")
    cursor = conn.cursor()

    # Execute a query to check if the nim and nama combination exists in the database
    query = "SELECT COUNT(*) FROM peminjam WHERE email = ? AND password = ?"
    cursor.execute(query, (email, password))
    result = cursor.fetchone()[0]

    # Close the database connection
    conn.close()

    # Return True if the nim and nama combination exists, else False
    return result > 0

@app.post("/signin")
def sign_in(user: PemLogin):
    email = user.email
    password = user.password

    # Perform authentication by checking against the SQLite database
    if authenticate_user(email, password):
        id = get_user_id(email)
        response = {"message": "Sign-in successful", "email": email, "id": id}
        return JSONResponse(content=response, status_code=201)
    else:
        raise HTTPException(status_code=401, detail="Invalid email or password")
