AgentDetailsVerificationModel _verificationModel = AgentDetailsVerificationModel(
  panDetails: PanDetails(),
  shopDetails: ShopDetails(),
);

AgentDetailsVerificationModel get getVerificationModel => _verificationModel;

set setVerificationModel(AgentDetailsVerificationModel value) =>
    _verificationModel = value;

class AgentDetailsVerificationModel {
  String? mobileNumber;
  String? emailAddress;
  String? passcode;
  bool? biometricStatus;
  PanDetails panDetails = PanDetails();
  ShopDetails shopDetails = ShopDetails();

  AgentDetailsVerificationModel({
    this.mobileNumber,
    this.emailAddress,
    this.passcode,
    this.biometricStatus,
    required this.panDetails,
    required this.shopDetails,
  });

  AgentDetailsVerificationModel.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    emailAddress = json['email_address'];
    passcode = json['passcode'];
    biometricStatus = json['biometric_status'];
    panDetails = PanDetails.fromJson(json['pan_details']);

    shopDetails = ShopDetails.fromJson(json['shop_details']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_number'] = mobileNumber;
    data['email_address'] = emailAddress;
    data['passcode'] = passcode;
    data['biometric_status'] = biometricStatus;
    data['pan_details'] = panDetails.toJson();
    data['shop_details'] = shopDetails.toJson();
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
