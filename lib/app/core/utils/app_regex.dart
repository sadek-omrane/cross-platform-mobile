class AppRegex {
  static bool isEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isPhoneNumber(String phone) {
    // is french phone number format
    return RegExp(r'^0[1-9]([-. ]?[0-9]{2}){4}$').hasMatch(phone);
  }

  static bool isPassword(String password) {
    // 6 character at least
    return RegExp(r'^.{6,}$').hasMatch(password);
  }

  static bool isUsername(String username) {
    // 3 to 30 characters, only letters, numbers, - and _
    return RegExp(r'^[a-zA-Z0-9_-]{3,30}$').hasMatch(username);
  }

  static bool isName(String name) {
    // 3 to 30 characters, only letters and spaces
    return RegExp(r'^[a-zA-Z ]{3,30}$').hasMatch(name);
  }

  static bool isNumber(String number) {
    return RegExp(r'^[0-9]+$').hasMatch(number);
  }

  //is price format 0.00
  static bool isPrice(String price) {
    return RegExp(r'^[0-9]+(\.[0-9]{1,2})?$').hasMatch(price);
  }

  //is date format yyyy-mm-dd
  static bool isDate(String date) {
    return RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(date);
  }

  //is time format hh:mm or hh:mm:ss
  static bool isTime(String time) {
    return RegExp(r'^\d{2}:\d{2}(:\d{2})?$').hasMatch(time);
  }

  // is french siret number
  static bool isSiret(String siret) {
    return RegExp(r'^\d{14}$').hasMatch(siret);
  }

  // is youtube video url
  static bool isYoutubeVideoUrl(String url) {
    return RegExp(r'^https://www.youtube.com/watch\?v=[a-zA-Z0-9_-]{11}$')
        .hasMatch(url);
  }

  // is percentage
  static bool isPercentage(String percentage) {
    return RegExp(r'^[0-9]{1,2}$').hasMatch(percentage);
  }
}
