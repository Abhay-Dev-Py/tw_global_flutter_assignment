AgentOnboardingModel onboardingModel = AgentOnboardingModel();

AgentOnboardingModel get getOnboardingModel => onboardingModel;

set setOnboardingModel(AgentOnboardingModel value) => onboardingModel = value;

class AgentOnboardingModel {
  String? mobileNumber;
  String? emailAddress;
  String? passcode;
  bool? biometricStatus;
  PanDetails? panDetails;
  ShopDetails? shopDetails;
  IibfCertificateDetails? iibfCertificateDetails;
  String? offlineVerificationDateTime;

  AgentOnboardingModel({
    this.mobileNumber,
    this.emailAddress,
    this.passcode,
    this.biometricStatus,
    this.panDetails,
    this.shopDetails,
    this.iibfCertificateDetails,
    this.offlineVerificationDateTime,
  });

  AgentOnboardingModel.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    emailAddress = json['email_address'];
    passcode = json['passcode'];
    biometricStatus = json['biometric_status'];
    panDetails = json['pan_details'] != null
        ? PanDetails.fromJson(json['pan_details'])
        : null;
    shopDetails = json['shop_details'] != null
        ? ShopDetails.fromJson(json['shop_details'])
        : null;
    iibfCertificateDetails = json['iibf_certificate_details'] != null
        ? IibfCertificateDetails.fromJson(json['iibf_certificate_details'])
        : null;
    offlineVerificationDateTime = json['offline_verification_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_number'] = this.mobileNumber;
    data['email_address'] = this.emailAddress;
    data['passcode'] = this.passcode;
    data['biometric_status'] = this.biometricStatus;
    if (this.panDetails != null) {
      data['pan_details'] = this.panDetails!.toJson();
    }
    if (this.shopDetails != null) {
      data['shop_details'] = this.shopDetails!.toJson();
    }
    if (this.iibfCertificateDetails != null) {
      data['iibf_certificate_details'] = this.iibfCertificateDetails!.toJson();
    }
    data['offline_verification_date_time'] = this.offlineVerificationDateTime;
    return data;
  }
}

class PanDetails {
  String? panNumber;
  String? fullName;
  String? dateOfBirth;

  PanDetails({this.panNumber, this.fullName, this.dateOfBirth});

  PanDetails.fromJson(Map<String, dynamic> json) {
    panNumber = json['pan_number'];
    fullName = json['full_name'];
    dateOfBirth = json['date_of_birth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pan_number'] = this.panNumber;
    data['full_name'] = this.fullName;
    data['date_of_birth'] = this.dateOfBirth;
    return data;
  }
}

class ShopDetails {
  String? shopName;
  String? shopAddress;
  String? city;
  String? state;
  String? country;
  String? pincode;

  ShopDetails({
    this.shopName,
    this.shopAddress,
    this.city,
    this.state,
    this.country,
    this.pincode,
  });

  ShopDetails.fromJson(Map<String, dynamic> json) {
    shopName = json['shop_name'];
    shopAddress = json['shop_address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shop_name'] = this.shopName;
    data['shop_address'] = this.shopAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['pincode'] = this.pincode;
    return data;
  }
}

class IibfCertificateDetails {
  String? registrationNumber;
  String? serialNumber;
  String? dateOfCertificateIssue;
  String? certificatePhotoFilePath;

  IibfCertificateDetails({
    this.registrationNumber,
    this.serialNumber,
    this.dateOfCertificateIssue,
    this.certificatePhotoFilePath,
  });

  IibfCertificateDetails.fromJson(Map<String, dynamic> json) {
    registrationNumber = json['registration_number'];
    serialNumber = json['serial_number'];
    dateOfCertificateIssue = json['date_of_certificate_issue'];
    certificatePhotoFilePath = json['certificate_photo_file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['registration_number'] = this.registrationNumber;
    data['serial_number'] = this.serialNumber;
    data['date_of_certificate_issue'] = this.dateOfCertificateIssue;
    data['certificate_photo_file_path'] = this.certificatePhotoFilePath;
    return data;
  }
}
