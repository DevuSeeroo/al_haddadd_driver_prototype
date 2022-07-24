class Login {
  String phnNumber = "+966123456798";
  bool isValid = false;
  void validation(String value) {
    if (value.isEmpty) {
      isValid = false;
      return;
    }
    isValid = true;
  }
}
