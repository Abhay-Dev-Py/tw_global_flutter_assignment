import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class AppValidators {
  static String? validateEmpty(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateTEmpty<T>(T? v) {
    if (v == null) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateEmail(String? v) {
    if (v!.isEmpty) {
      return Strings.emailCantBeEmpty;
    } else if (!GetUtils.isEmail(v)) {
      return Strings.enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePhone(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (v.length != 10) {
      return Strings.enterValidNumber;
    } else {
      return null;
    }
  }

  static String? validateDOB(String? dobString) {
    if (dobString == null || dobString.isEmpty) {
      return Strings.fieldCantBeEmpty;
    }

    try {
      DateTime dob = DateFormat('dd-MM-yyyy').parseStrict(dobString);

      // Calculate age based on the current date
      DateTime currentDate = DateTime.now();
      int age = currentDate.year - dob.year;

      if (currentDate.month < dob.month ||
          (currentDate.month == dob.month && currentDate.day < dob.day)) {
        age--;
      }

      if (age < 18) {
        return Strings.ageMustBeGreaterThan18;
      }

      return null;
    } catch (e) {
      return Strings.enterValidDOB;
    }
  }

  static String? validatePAN(String? pan) {
    if (pan == null || pan.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$').hasMatch(pan)) {
      return Strings.enterValidPAN;
    } else {
      return null;
    }
  }

  static String? validateIIBFRegistrationNumber(String? iibfNumber) {
    if (iibfNumber == null || iibfNumber.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (!RegExp(r'^[A-Z]{3}[0-9]{7}$').hasMatch(iibfNumber)) {
      return Strings.enterValidIIBF;
    } else {
      return null;
    }
  }

  static String? validateIIBFSerial(String? iibfSerial) {
    if (iibfSerial == null || iibfSerial.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (!RegExp(r'^[A-Z]{2}[0-9]{6}$').hasMatch(iibfSerial)) {
      return Strings.enterValidIIBFSerial;
    } else {
      return null;
    }
  }

  static String? validateOTP(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (v.length != 6) {
      return Strings.enterValidOTP;
    } else {
      return null;
    }
  }

  static String? validatePasscode(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (v.length != 4) {
      return Strings.enterValidOTP;
    } else {
      return null;
    }
  }

  static String? validateEmailPhone(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (GetUtils.isNumericOnly(v)) {
      return validatePhone(v);
    } else {
      return validateEmail(v);
    }
  }

  static String? validatePassword(String? v) {
    if (v!.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 8) {
      return Strings.passwordValidation;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? v, String password) {
    if (v!.isEmpty || password.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 8 || password.length < 8 || v != password) {
      return Strings.confirmPasswordValidation;
    } else {
      return null;
    }
  }

  static String? validateCheckbox({
    bool v = false,
    String error = Strings.checkboxValidation,
  }) {
    if (!v) {
      return error;
    } else {
      return null;
    }
  }
}
