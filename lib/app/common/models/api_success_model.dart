class ApiSuccessResponseModel {
  String? message;
  bool status = false;
  String? type;
  ErrorStatus? errorStatus;
  Map? data;

  ApiSuccessResponseModel({
    this.message,
    required this.status,
    this.type,
    this.errorStatus,
    this.data,
  });

  ApiSuccessResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    type = json['type'];
    errorStatus = json['error_status'] != null
        ? ErrorStatus.fromJson(json['error_status'])
        : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    data['status'] = this.status;
    data['type'] = this.type;
    if (this.errorStatus != null) {
      data['error_status'] = this.errorStatus!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}

class ErrorStatus {
  String? errorCode;

  ErrorStatus({this.errorCode});

  ErrorStatus.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = this.errorCode;
    return data;
  }
}
