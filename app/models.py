from flask_login import UserMixin
from datetime import datetime
from . import db


class User(UserMixin, db.Model):
    id_users = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.VARCHAR(200), unique=True)
    password = db.Column(db.VARCHAR(200))
    nama = db.Column(db.VARCHAR(200))
    telp = db.Column(db.VARCHAR(200))
    level = db.Column(db.Integer)
    foto = db.Column(db.VARCHAR(200))
    create_time = db.Column(db.DateTime, default=datetime.now())
    # last_update
    # session_id
    # status

    def get_id(self):
           return (self.id_users)


class Provinsi(db.Model):
    id_prov = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.VARCHAR(200))

    kab = db.relationship("Kabupaten", backref="provinsi")


class Kabupaten(db.Model):
    id_kab = db.Column(db.Integer, primary_key=True)
    id_prov = db.Column(db.Integer, db.ForeignKey('provinsi.id_prov'))
    nama = db.Column(db.VARCHAR(200))

    kec = db.relationship("Kecamatan", backref="kabupaten")


class Kecamatan(db.Model):
    id_kec = db.Column(db.Integer, primary_key=True)
    id_kab = db.Column(db.Integer, db.ForeignKey('kabupaten.id_kab'))
    nama = db.Column(db.VARCHAR(200))

    desa = db.relationship("Desa", backref="kecamatan")


class Desa(db.Model):
    id_desa = db.Column(db.BigInteger, primary_key=True)
    id_kec = db.Column(db.Integer, db.ForeignKey('kecamatan.id_kec'))
    nama = db.Column(db.VARCHAR(200))
    polygon = db.Column(db.JSON)

    gapoktan = db.relationship("Gapoktan", backref="desa")
    poktan = db.relationship("Kelompok_Tani", backref="desa")


class Gapoktan(db.Model):
    id_gapoktan = db.Column(db.BigInteger, primary_key=True)
    id_desa = db.Column(db.BigInteger, db.ForeignKey('desa.id_desa'))
    nama = db.Column(db.VARCHAR(200))
    ketua = db.Column(db.VARCHAR(200))
    telp = db.Column(db.VARCHAR(200))
    no_sk = db.Column(db.VARCHAR(200))


class Kelompok_Tani(db.Model):
    id_poktan = db.Column(db.BigInteger, primary_key=True)
    id_desa = db.Column(db.BigInteger, db.ForeignKey('desa.id_desa'))
    nama = db.Column(db.VARCHAR(200))
    telp = db.Column(db.VARCHAR(200))
    no_sk = db.Column(db.VARCHAR(200))

    petani = db.relationship("Petani", backref="kelompok_tani")


class Petani(db.Model):
    id_petani = db.Column(db.BigInteger, primary_key=True)
    id_poktan = db.Column(db.BigInteger, db.ForeignKey('kelompok__tani.id_poktan'))
    nama = db.Column(db.VARCHAR(200))
    nik = db.Column(db.VARCHAR(200))
    no_kk = db.Column(db.VARCHAR(200))
    no_ktp = db.Column(db.VARCHAR(200))
    tempat_lahir = db.Column(db.VARCHAR(200))
    tanggal_lahir = db.Column(db.VARCHAR(200))
    telp = db.Column(db.VARCHAR(200))
    alamat = db.Column(db.VARCHAR(200))
    foto = db.Column(db.VARCHAR(200))
    pin_kordinat = db.Column(db.VARCHAR(200))

    lahan = db.relationship("Lahan", backref="petani")


class Lahan(db.Model):
    id_lahan = db.Column(db.BigInteger, primary_key=True)
    id_petani = db.Column(db.BigInteger, db.ForeignKey('petani.id_petani'))
    alamat = db.Column(db.VARCHAR(200))
    luas = db.Column(db.VARCHAR(200))
    datetime = db.Column(db.VARCHAR(200))
    foto = db.Column(db.VARCHAR(200))
    polygon = db.Column(db.JSON)

    log_tanam = db.relationship("Log_Tanam", backref="lahan")


class Komoditas(db.Model):
    id_komoditas = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.VARCHAR(200))
    vol_sat = db.Column(db.Integer)
    harga = db.Column(db.Integer)
    pemulia = db.Column(db.VARCHAR(200))
    keterangan = db.Column(db.VARCHAR(200))

    log_tanam = db.relationship("Log_Tanam", backref="komoditas")


class Pupuk(db.Model):
    id_pupuk = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.VARCHAR(200))
    vol_sat = db.Column(db.Integer)
    harga = db.Column(db.Integer)
    pemulia = db.Column(db.VARCHAR(200))
    keterangan = db.Column(db.VARCHAR(200))

    detaillog_pupuk = db.relationship("Detail_Log_Tanam_Pupuk", backref="pupuk")


class Racun(db.Model):
    id_racun = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.VARCHAR(200))
    vol_sat = db.Column(db.Integer)
    harga = db.Column(db.Integer)
    pemulia = db.Column(db.VARCHAR(200))
    keterangan = db.Column(db.VARCHAR(200))

    detaillog_racun = db.relationship("Detail_Log_Tanam_Racun", backref="racun")


class Log_Tanam(db.Model):
    id_log = db.Column(db.Integer, primary_key=True)
    id_lahan = db.Column(db.BigInteger, db.ForeignKey('lahan.id_lahan'))
    id_komoditas = db.Column(db.Integer, db.ForeignKey('komoditas.id_komoditas'))
    tgl_mulai = db.Column(db.VARCHAR(200))
    tgl_selesai = db.Column(db.VARCHAR(200))
    total_produksi = db.Column(db.Integer)

    detail_log_tanam_pupuk = db.relationship("Detail_Log_Tanam_Pupuk", backref="log_tanam")
    detail_log_tanam_racun = db.relationship("Detail_Log_Tanam_Racun", backref="log_tanam")


class Detail_Log_Tanam_Pupuk(db.Model):
    id_detaillog = db.Column(db.Integer, primary_key=True)
    id_pupuk = db.Column(db.Integer, db.ForeignKey('pupuk.id_pupuk'))
    id_log = db.Column(db.Integer, db.ForeignKey('log__tanam.id_log'))


class Detail_Log_Tanam_Racun(db.Model):
    id_detaillog = db.Column(db.Integer, primary_key=True)
    id_racun = db.Column(db.Integer, db.ForeignKey('racun.id_racun'))
    id_log = db.Column(db.Integer, db.ForeignKey('log__tanam.id_log'))

class Harga_Beras(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    harga = db.Column(db.Integer)
    waktu = db.Column(db.VARCHAR(200))