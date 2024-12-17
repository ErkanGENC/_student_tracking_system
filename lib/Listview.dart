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
      drawer: Drawer(
        child: Text('Drawer'),
        backgroundColor: Colors.red,
        width: 100,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'EZGİ'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'ERKAN'),
        ],
      ),
      endDrawer: Drawer(
        child: Text('Drawer'),
        backgroundColor: Colors.red,
        width: 100,
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
                String mesaj = "";
                int puan = 45;
                if (puan >= 50) {
                  mesaj = "geçti";
                } else if (puan >= 40) {
                  mesaj = "Bütünlemeye kaldi.";
                } else {
                  mesaj = "Kaldi";
                }

                var alert = AlertDialog(
                  title: Text('Sinav sonucu'),
                  content: Text(mesaj),
                );
                showDialog(
                    context: context, builder: (BuildContext context) => alert);
              },
            ),
          ),
        ],
      ),
    ); // Replace with your desired widget
  }
}
