import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';

class PasscodeProvider extends ChangeNotifier {
  //container color
  String _passcode = '';
  String get passcode => _passcode;

  void setPasscode(String val) {
    _passcode = val;
    notifyListeners();
  }

  void clearPassCode() {
    _passcode = '';
    notifyListeners();
  }

  //used for deleting one pin
  void deletePasscode() {
    if (_passcode.isNotEmpty) {
      _passcode = _passcode.substring(0, _passcode.length - 1);
      notifyListeners();
    }
  }

  //signin flow
  Either setAppPasscode(String value) {
    if (_passcode.length < 4) {
      _passcode += value;
      notifyListeners();
      if (passcode.length == 4) {
        return Right(passcode);
      }
    }
    return const Left("");
  }
}
