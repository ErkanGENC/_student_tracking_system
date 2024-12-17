mixin StudentValidatorMixin {
  String? validateFirstName(String value) {
    if (value.length < 2) {
      return "isim en az 2 karakter olmalidir.";
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.length < 2) {
      return "soyisim en az 2 karakter olmalidir.";
    }
    return null;
  }

  String? validateGrade(String value) {
    int grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "notun 0-100 arasinda olmalidir.";
    }
    return null;
  }
}
