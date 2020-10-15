import 'package:flutter_app/model/model_makanan.dart';

class DataMakanan {
  //buat data dummy untuk item makanan
  static var itemMakanan = [
    ModelMakanan(
        "ayam goreng",
        "https://id.wikipedia.org/wiki/Ayam_goreng",
        "Ayam goreng adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/ayam.jpg"),
    ModelMakanan(
        "bakso",
        "https://id.wikipedia.org/wiki/Bakso",
        "bakso adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/bakso.jpg"),
    ModelMakanan(
        "sate",
        "https://id.wikipedia.org/wiki/Sate",
        "sate adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/sate.jpg"),
    ModelMakanan(
        "soto",
        "https://id.wikipedia.org/wiki/Soto",
        "soto adalah hidangan yang dibuat dari daging ayam dicampur tepung bumbu yang digoreng dalam minyak goreng panas. ",
        "gambar/soto.jpg"),
    ModelMakanan(
        "rendang",
        "https://id.wikipedia.org/wiki/Rendang",
        "Rendang atau randang (Jawi: رندڠ) adalah masakan daging yang berasal dari Minangkabau. Masakan ini dihasilkan dari proses memasak suhu rendah dalam waktu lama menggunakan aneka rempah-rempah dan santan.",
        "gambar/rendang.jpg"),
  ];

  //untuk mengambil total data yang akan ditampilkan
  static var itemCount = itemMakanan.length;

  //get item sesuaai dengan index
  static ModelMakanan getItemMakanan(int index) {
    return itemMakanan[index];
  }
}
