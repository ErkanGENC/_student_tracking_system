class student {
  int id = 0;
  String firstName = "";
  String lastName = "";
  int grade = 0;
  String status = "";

  student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  student.yedek();

  String get getFirstName {
    return "AD--> " + this.firstName;
  }

  void set setFirstName(String value) {
    this.firstName = value;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "geçti";
    } else if (this.grade >= 40) {
      message = "Bütünlemeye kaldi.";
    } else {
      message = "Kaldi";
    }
    return message;
  }
}
