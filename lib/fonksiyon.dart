import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: myApp(),
    ),
  );
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var kisiler = ["ERKAN GENÇ", "EZGİ GENÇ", "SİNAN GENÇ", "SİNEM GENÇ"];
    // Implement your widget tree here
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Adım Adım Öğrenme'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          //Listview.builder widget'i dart dilindeki döngü işlemini yapmaya yarar.
          Expanded(
            child: ListView.builder(
                itemCount: kisiler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(kisiler[index]);
                }),
          ),
          Center(
            child: ElevatedButton(
              child: Text('sonucu gör'),
              onPressed: () {
                var mesaj = sinavHesapla(50);
                mesajGoster(context, mesaj);
              },
            ),
          ),
        ],
      ),
    ); // Replace with your desired widget
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "geçti";
    } else if (puan >= 40) {
      mesaj = "Bütünlemeye kaldi.";
    } else {
      mesaj = "Kaldi";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text('Sinav sonucu'),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
