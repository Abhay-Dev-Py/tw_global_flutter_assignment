import 'package:flutter_getx_template/app/common/constants.dart';

class PanErrorModel {
  final String errorTitle;
  final String errorDescription;
  final PanErrorCodes errorCode;

  PanErrorModel({
    required this.errorTitle,
    required this.errorDescription,
    required this.errorCode,
  });
}

generatePanErrorModel(PanErrorCodes panErrorCode) {
  String errorTitle;
  String errorDescription;
  switch (panErrorCode) {
    case PanErrorCodes.unable_to_read_pan_data:
      errorTitle = "Unable to read your PAN data";
      errorDescription =
          "Looks like the uploaded PAN image was not clear. Please re-upload  to continue KYC.";
      break;
    case PanErrorCodes.invalid_pan_number:
      errorTitle = "Invalid PAN Number";
      errorDescription =
          "Sorry! The PAN Number provided does not exist in the NSDL database. Please retry verification with a valid PAN card.";
      break;
    case PanErrorCodes.pan_mismatch:
      errorTitle = "PAN Mismatch!";
      errorDescription =
          "Sorry! The PAN Number provided does not belong to this user as per NSDL database. Please retry verification.";
      break;

    case PanErrorCodes.pan_upload_error:
      errorTitle = "PAN Upload Error!";
      errorDescription =
          "Sorry! Our records indicate that you have uploaded a different PAN from the one used during Onboarding KYC. Please upload the same PAN card.";
      break;

    case PanErrorCodes.kyc_processing_error:
      errorTitle = "KYC Processing Error";
      errorDescription =
          "We've encountered an error processing your uploaded documents. Please try again.";
      break;

    case PanErrorCodes.pan_aadhar_not_linked:
      errorTitle = "PAN Aadhaar Not Linked!";
      errorDescription =
          "We're sorry to inform you that as per Income Tax Department regulations, you cannot proceed as your PAN and Aadhaar are not linked.";
      break;

    case PanErrorCodes.pan_upload_restricted:
      errorTitle = "Sorry! Uploaded PAN is restricted";
      errorDescription =
          "Apologies! The provided PAN is restricted for onboarding due to non-compliance with bank requirements.";
      break;

    case PanErrorCodes.you_can_not_proceed:
      errorTitle = "Sorry! you cannot proceed";
      errorDescription =
          "The uploaded PAN number is not supported for YES Bank account creation or linking. ";
      break;
  }
  return PanErrorModel(
    errorTitle: errorTitle,
    errorDescription: errorDescription,
    errorCode: panErrorCode,
  );
}
