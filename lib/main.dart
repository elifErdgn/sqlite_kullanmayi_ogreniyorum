import 'package:flutter/material.dart';
import 'package:sqllite_kullanimi/Kisiler_model.dart';
import 'package:sqllite_kullanimi/veriOkuma.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> kisilerGoster() async {
    var liste = await Kisilerdao().tumKisiler();

    for (Kisiler k in liste) {
      print("***************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi yas : ${k.kisi_yas}");
    }
  }

  Future<void> ekle() async {
    await Kisilerdao().kisiEkle("Sedat", 37);
  }

  Future<void> sil() async {
    await Kisilerdao().kisiSil(1);
  }

  Future<void> guncelle() async {
    await Kisilerdao().kisiGuncelle(4, "Yeni Ece", 99);
  }

  Future<void> kayitKontrol() async {
    int sonuc = await Kisilerdao().kayitKontrol("ahmet");
    print("Veritabanındaki ahmet sayisi: $sonuc");
  }

  Future<void> getir() async {
    var kisi = await Kisilerdao().kisiGetir(1);

    print("****** KİŞİ GETİR *********");
    print("Kişi id : ${kisi.kisi_id}");
    print("Kişi ad : ${kisi.kisi_ad}");
    print("Kişi yas : ${kisi.kisi_yas}");
  }

  Future<void> arama() async {
    var liste = await Kisilerdao().kisiArama("a");

   for(Kisiler k in liste){
     print("****** KİŞİ arama *********");
     print("Kişi id : ${k.kisi_id}");
     print("Kişi ad : ${k.kisi_ad}");
     print("Kişi yas : ${k.kisi_yas}");
   }
  }

  Future<void> rastgeleGetir() async {
    var liste = await Kisilerdao().rastgele2kisiGetir();

   for(Kisiler k in liste){
     print("****** KİŞİ arama *********");
     print("Kişi id : ${k.kisi_id}");
     print("Kişi ad : ${k.kisi_ad}");
     print("Kişi yas : ${k.kisi_yas}");
   }
  }

  @override
  void initState() {
    super.initState();
    ekle();
    sil();
    kisilerGoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
