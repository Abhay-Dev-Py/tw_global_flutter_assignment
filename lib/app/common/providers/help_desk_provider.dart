import 'package:flutter/material.dart';

class HelpDeskProvider extends ChangeNotifier {
  List<String> issueType = [
    "General question",
    "Technical issue",
    "Other issue",
    "Request account statement",
    "Request trade confirmation",
    "Inquire about cash deposit",
    "Help in transacting",
  ];

  int _selectedIssue = -1;
  int get selectedIssue => this._selectedIssue;

  set selectedIssue(int value) {
    this._selectedIssue = value;
    notifyListeners();
  }

  final TextEditingController _ticketSubjectController = TextEditingController();
  TextEditingController get ticketSubjectController =>
      this._ticketSubjectController;

  set setTicketSubjectControllerValue(String value) {
    this._ticketSubjectController.text = value;
    notifyListeners();
  }
}
