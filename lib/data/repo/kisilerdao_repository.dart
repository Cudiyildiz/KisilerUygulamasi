import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class KisilerDaoRespository{
  Future<void> kaydet(String kisi_ad,String kisi_tel) async{
    print("Kişi Kaydet: $kisi_ad - $kisi_tel");
  }

  Future<void> guncelle(int kisi_id,String kisi_ad,String kisi_tel) async{
    print("Kişi Kaydet: $kisi_id - $kisi_ad - $kisi_tel");
  }

  Future<void> sil(int kisi_id) async{
    print("Kişi Silindi : $kisi_id");
  }

  Future<List<Kisiler>> kisileriYukle() async{
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_adi: "Cudi", kisi_tel: "05464317500");
    var k2 = Kisiler(kisi_id: 2, kisi_adi: "Ferhat", kisi_tel: "05464317695");
    var k3 = Kisiler(kisi_id: 3, kisi_adi: "Hüseyin", kisi_tel: "05467589841");
    var k4 = Kisiler(kisi_id: 4, kisi_adi: "Ahmet", kisi_tel: "64454655465");
    var k5 = Kisiler(kisi_id: 5, kisi_adi: "Yakup", kisi_tel: "46454515666");
    var k6 = Kisiler(kisi_id: 6, kisi_adi: "Enes", kisi_tel: "46416546546");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    kisilerListesi.add(k4);
    kisilerListesi.add(k5);
    kisilerListesi.add(k6);
    return kisilerListesi;
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async{
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_adi: "Cudi", kisi_tel: "05464317500");
    var k2 = Kisiler(kisi_id: 2, kisi_adi: "Ferhat", kisi_tel: "05464317695");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    return kisilerListesi;
  }

}