import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  bool _isCertificateUploaded = false;
  bool get isCertificateUploaded => this._isCertificateUploaded;

  set isCertificateUploaded(bool value) {
    this._isCertificateUploaded = value;
    notifyListeners();
  }

  bool _isAdminAssigned = false;
 bool get isAdminAssigned => this._isAdminAssigned;

 set isAdminAssigned(bool value) => this._isAdminAssigned = value;
}
