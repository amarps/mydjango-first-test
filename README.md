# simple blog

My first blog using django

> db : postgresql
- HOST : 127.0.0.1
- PORT : 5432

> cache : redis 
- HOST : 127.0.0.1
- PORT : 6379


## feature
- [x] Comment
- [x] CRUD Blog
- [x] Login Register User
- [x] Sample Database

## Tested On
> Arch Linux x86_64

## How To Install
clone and install project
```
git clone https://github.com/amarps/mydjango-first-test.git
cd mydjango-first-test
pip install -r requirements.txt
```
import database
```
sudo su - postgres
createdb djangogirls
exit
psql -U admin djangogirls < example_dbexports.pgsql
```
run the code
```
python manage.py runserver
```
Go to url section in your browser and type 127.0.0.1:8000/blogs.

Done :D.