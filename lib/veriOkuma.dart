import 'package:sqllite_kullanimi/Kisiler_model.dart';
import 'package:sqllite_kullanimi/veritabaniyardimcisi.dart';

class Kisilerdao {
  Future<List<Kisiler>> tumKisiler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisi();

    List<Map<String, dynamic>> maps =
        await db!.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(
        satir["kisi_id"],
        satir["kisi_ad"],
        satir["kisi_yas"],
      );
    });
  }

  /// kişi kaydı
  Future<void> kisiEkle(String kisi_ad, int kisi_yas) async {
    var db = await VeritabaniYardimcisi.veritabaniErisi();

    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_yas"] = kisi_yas;

    await db!.insert("kisiler", bilgiler);
  }

  /// kişi kaydı
  Future<void> kisiSil(int kisi_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisi();

    await db!.delete("kisiler", where: "kisi_id=?", whereArgs: [kisi_id]);
  }

  /// kişi kaydı
  Future<void> kisiGuncelle(int kisi_id, String kisi_ad, int kisi_yas) async {
    var db = await VeritabaniYardimcisi.veritabaniErisi();

    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_yas"] = kisi_yas;

    await db!.update("kisiler", bilgiler,
        where: "kisi_id = ?", whereArgs: [kisi_id]);
  }

  /// kayıt kontrol
  Future<int> kayitKontrol(String kisi_ad) async {
    var db = await VeritabaniYardimcisi.veritabaniErisi();

    List<Map<String, dynamic>> maps = await db!.rawQuery(
        "SELECT count(*) AS sonuc FROM kisiler WHERE kisi_ad='$kisi_ad' ");
    return maps[0]["sonuc"];
  }

  /// kayıt kontrol
  Future<Kisiler> kisiGetir(int kisi_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisi();

    List<Map<String, dynamic>> maps = await db!.rawQuery("SELECT * FROM kisiler WHERE kisi_id=$kisi_id");

    var satir = maps[0];
    return Kisiler(satir["kisi_id"],satir["kisi_ad"],satir["kisi_yas"],);

  }
  /// kişi aramna
  Future<List<Kisiler>> kisiArama(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisi();

    List<Map<String, dynamic>> maps = await db!.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(satir["kisi_id"],satir["kisi_ad"],satir["kisi_yas"],);
    });

  }
  /// kişi aramna
  Future<List<Kisiler>> rastgele2kisiGetir()  async {
    var db = await VeritabaniYardimcisi.veritabaniErisi();

    List<Map<String, dynamic>> maps = await db!.rawQuery("SELECT * FROM kisiler ORDER BY RANDOM() LIMIT 2");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(satir["kisi_id"],satir["kisi_ad"],satir["kisi_yas"],);
    });

  }






}
