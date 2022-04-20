import '../constants.dart';

class Validators {
  static String? registration(String? value) {
    if (value == null) {
      return kRequired;
    }
    final regEx = RegExp(
        r'(^[A-Z]{2}[0-9]{2}\s?[A-Z]{3}$)|(^[A-Z][0-9]{1,3}[A-Z]{3}$)|(^[A-Z]{3}[0-9]{1,3}[A-Z]$)|(^[0-9]{1,4}[A-Z]{1,2}$)|(^[0-9]{1,3}[A-Z]{1,3}$)|(^[A-Z]{1,2}[0-9]{1,4}$)|(^[A-Z]{1,3}[0-9]{1,3}$)|(^[A-Z]{1,3}[0-9]{1,4}$)|(^[0-9]{3}[DX]{1}[0-9]{3}$)');
    final val = value.replaceAll(' ', '').toUpperCase();
    if (!regEx.hasMatch(val)) {
      return 'Not valid';
    }
    return null;
  }
}
