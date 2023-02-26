import 'dart:io';

import 'package:flutter/services.dart'; 
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static final String veritabaniAdi = "rehber.sqlite";

  static Future<Database?> veritabaniErisi() async {
    String veritabaniYOlu = join(await getDatabasesPath(), veritabaniAdi);

    if (await databaseExists(veritabaniYOlu)) {
      print("Veritabanı zaten var.Kopyalamaya gerek yok");
    } else {
      ByteData data = await rootBundle.load("veritaban/$veritabaniAdi");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veritabaniYOlu).writeAsBytes(bytes, flush: true);
      print("Veritabanı kopyalandı");
    }

    return openDatabase(veritabaniYOlu);
  }
}
