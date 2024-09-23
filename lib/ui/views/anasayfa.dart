import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;
  Future<void> ara(String aramaKelimesi) async{
    print("Kisi ara : $aramaKelimesi");
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
  Future<void> sil(int kisi_id) async{
    print("Kişi Silindi : $kisi_id");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            ara(aramaSonucu);
          },
        ) :
        const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
          }, icon: Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: Icon(Icons.search))
        ],
      ),
      body:FutureBuilder<List<Kisiler>>(
        future: kisileriYukle(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length,
              itemBuilder: (context,indeks){
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi)))
                        .then((value){
                      print("Anasayfaya dönüldü");
                    });
                  },
                  child: Card(
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kisi.kisi_adi,style: TextStyle(fontSize: 20),),
                                Text(kisi.kisi_tel),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("${kisi.kisi_adi} Silinsin Mi?"),
                                action: SnackBarAction(
                                  label: "Evet",
                                  onPressed: (){
                                    sil(kisi.kisi_id);
                                  },
                                ),
                              )
                            );
                          }, icon: const Icon(Icons.clear,color: Colors.black54,))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value){
            print("Anasayfaya dönüldü");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
