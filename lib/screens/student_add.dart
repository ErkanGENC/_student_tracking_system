import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_1/student/student.dart';
import 'package:flutter_1/validation/student_validator.dart';

var students = student.yedek();
var formKey = GlobalKey<FormState>();

class StudentAdd extends StatefulWidget {
  final List<student> students;

  StudentAdd(this.students);

  @override
  State<StudentAdd> createState() => _StudentAddState(students);
}

class _StudentAddState extends State<StudentAdd> with StudentValidatorMixin {
  List<student> students;
  student newStudent = student("", "", 0);
  _StudentAddState(this.students);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanici kayit sayfasi"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Kullanici adi", hintText: "example; ERKAN"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "lütfen adi girin.";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null || value!.isNotEmpty) {
          newStudent.firstName = value;
        }
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Kullanici Soyadi", hintText: "example; GENC"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "lütfen soyadi girin.";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null) {
          newStudent.lastName = value;
        }
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Notu", hintText: "example; 65"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "lütfen 0-100 arasinda girin.";
        }
        int grade = int.parse(value);
        if (grade < 0 || grade > 100) {
          return "notun 0-100 arasinda olmalidir.";
        }
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          newStudent.grade = int.parse(value);
        }
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        var formdata = formKey.currentState;
        if (formdata != null && formdata.validate()) {
          formdata.save();
          students.add(student(
              newStudent.firstName, newStudent.lastName, newStudent.grade));
          saveStudent();
          Navigator.pop(context);
        }
      },
      child: Text("Kaydet"),
    );
  }

  void saveStudent() {
    print(newStudent.firstName);
    print(newStudent.lastName);
    print(newStudent.grade);
  }
}
