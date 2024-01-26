AgentOnboardingModel _onboardingModel = AgentOnboardingModel(
  panDetails: PanDetails(),
  shopDetails: ShopDetails(),
  iibfCertificateDetails: IibfCertificateDetails(),
);

AgentOnboardingModel get getOnboardingModel => _onboardingModel;

set setOnboardingModel(AgentOnboardingModel value) => _onboardingModel = value;

class AgentOnboardingModel {
  String? mobileNumber;
  String? emailAddress;
  String? passcode;
  bool? biometricStatus;
  PanDetails panDetails = PanDetails();
  ShopDetails shopDetails = ShopDetails();
  IibfCertificateDetails iibfCertificateDetails = IibfCertificateDetails();
  String? offlineVerificationDateTime;
  

  AgentOnboardingModel({
    this.mobileNumber,
    this.emailAddress,
    this.passcode,
    this.biometricStatus,
    required this.panDetails,
    required this.shopDetails,
    required this.iibfCertificateDetails,
    this.offlineVerificationDateTime,
  });

  AgentOnboardingModel.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    emailAddress = json['email_address'];
    passcode = json['passcode'];
    biometricStatus = json['biometric_status'];
    panDetails = PanDetails.fromJson(json['pan_details']);

    shopDetails = ShopDetails.fromJson(json['shop_details']);
    iibfCertificateDetails =  IibfCertificateDetails.fromJson(json['iibf_certificate_details']);
    offlineVerificationDateTime = json['offline_verification_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_number'] = mobileNumber;
    data['email_address'] = emailAddress;
    data['passcode'] = passcode;
    data['biometric_status'] = biometricStatus;
    data['pan_details'] = panDetails.toJson();
    data['shop_details'] = shopDetails.toJson();
    data['iibf_certificate_details'] = iibfCertificateDetails.toJson();
      data['offline_verification_date_time'] = offlineVerificationDateTime;
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
    data['pan_number'] = panNumber;
    data['full_name'] = fullName;
    data['date_of_birth'] = dateOfBirth;
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
    data['shop_name'] = shopName;
    data['shop_address'] = shopAddress;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
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
    data['registration_number'] = registrationNumber;
    data['serial_number'] = serialNumber;
    data['date_of_certificate_issue'] = dateOfCertificateIssue;
    data['certificate_photo_file_path'] = certificatePhotoFilePath;
    return data;
  }
}
