# Quickstart

## 1. Clone File Github ke Directory Yang Diinginkan

Lebih mudah memakai Github Desktop. Link Download: [GitHub Desktop](https://desktop.github.com/)

## 2. Membuat Virtual Environment
	
Setelah Clone, masuk ke Folder 'STP'. Setelah berada didalam folder 'STP', masukkan syntax berikut ke terminal.

Membuat virtual environment:
 ```
 python -m venv env
 ```

Aktifasi virtual environment:
```
env\scripts\activate
```

Install library:
```
pip install -r requirements.txt
```
	
## 3. Menjalankan Program

```
set FLASK_APP=app.py
```
```
set FLASK_DEBUG=1
```
```
flask run
```
	
Membuka situs website:
[STP - Universitas Hasanuddin](http://127.0.0.1:5000/)
