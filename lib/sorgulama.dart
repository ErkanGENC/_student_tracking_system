import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: myApp()));
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text("Analiz"),
        backgroundColor: Colors.orange, // arka plan rengi
        foregroundColor: Colors.black, // yazisi
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("tikla"),
          onPressed: () {
            String mesaj = "";
            int puan = 45;
            if (puan >= 50)
              mesaj = "geçti";
            else if (puan >= 40)
              mesaj = "bütünleme";
            else
              mesaj = "kaldi";

            var alert = AlertDialog(
              title: Text("Sonucu Görün"),
              content: Text(mesaj),
            );
            showDialog(
                context: context, builder: (BuildContext context) => alert);
          },
        ),
      ),
    ); // Replace with your desired widget
  }
}
