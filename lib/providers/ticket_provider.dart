import 'package:flutter/material.dart';

class TicketProvider extends ChangeNotifier {
  int _addTicket = 0;

  int get addTicket => _addTicket;
  void penambahan() {
    _addTicket++;
    notifyListeners();
  }

  void pengurangan() {
    if (_addTicket > 0) {
      _addTicket--;
      notifyListeners();
    }
  }
}
