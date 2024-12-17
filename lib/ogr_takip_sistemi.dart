import 'package:flutter/material.dart';
import 'package:flutter_1/screens/student_edit.dart';
import 'package:flutter_1/student/student.dart';
import 'package:flutter_1/screens/student_add.dart';

void main() {
  runApp(
    MaterialApp(
      home: myApp(),
    ),
  );
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  student selectedStudent = student.withId(0, "", "", 0);

  List<student> students = [
    student.withId(1, "Erkan", "GENC", 45),
    student.withId(2, "Ezgi", "YILMAZ", 90),
    student.withId(3, "Yavuz", "KUK", 15)
  ];

  Widget build(BuildContext context) {
    // Implement your widget tree here
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Öğrenci not takip sistemi'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          //Listview.builder widget'i dart dilindeki döngü işlemini yapmaya yarar.
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: personalImage(students[index]),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("aldiği not: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.firstName);
                    },
                  );
                }),
          ),
          Text("Seçili Öğrenci: " +
              selectedStudent.firstName +
              " " +
              selectedStudent.lastName),

          Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor:
                        Colors.black, // Changed button color to green
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Öğrenci Ekle'),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));
                  },
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor:
                          Colors.black, // Changed button color to green
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.update),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('Güncelle'),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StudentEdit(selectedStudent)));
                    }),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor:
                        Colors.black, // Changed button color to green
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Bilgileri Sil'),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    var mesaj = "Silindi: " + selectedStudent.firstName;
                    mesajGoster(context, mesaj);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ); // Replace with your desired widget
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text('Bilgi!'),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.sentiment_neutral);
    } else {
      return Icon(Icons.clear);
    }
  }

  Widget personalImage(student student) {
    if (student.firstName == "Erkan") {
      return CircleAvatar(
        backgroundImage: NetworkImage(
            "https://cdn.pixabay.com/photo/2021/05/25/04/19/boy-6281260_1280.jpg"),
      );
    } else if (student.firstName == "Ezgi") {
      return CircleAvatar(
        backgroundImage: NetworkImage(
            "https://media.istockphoto.com/id/1763926700/tr/foto%C4%9Fraf/portrait-of-smiling-smart-school-boy-wearing-braces-on-teeth-looking-at-camera-education.jpg?s=1024x1024&w=is&k=20&c=14aKaCTD9i6nRWPpN4wYHFNkOml-MQ8HWnXxdMTCs_Y="),
      );
    } else {
      return CircleAvatar(
        backgroundImage: NetworkImage(
            "https://media.istockphoto.com/id/1708310032/tr/foto%C4%9Fraf/teenager-boy-under-stress.jpg?s=1024x1024&w=is&k=20&c=Ujt_eLsqPX2bfEF_l5RNlaI2kykpqYudtDIvOnUETx0="),
      );
    }
  }
}
