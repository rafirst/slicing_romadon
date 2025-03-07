import 'package:flutter/material.dart';



class TicketProvider extends ChangeNotifier {
  Map<int, int> _addTicket = {}; // Key: index tiket, Value: jumlah tiket

  int getAddTicket(int index) {
    return _addTicket[index] ?? 0; // Jika belum ada, default 0
  }

  void penambahan(int index) {
    _addTicket[index] = (_addTicket[index] ?? 0) + 1;
    notifyListeners();
  }

  void pengurangan(int index) {
    if (_addTicket[index] != null && _addTicket[index]! > 0) {
      _addTicket[index] = _addTicket[index]! - 1;
      notifyListeners();
    }
  }
}

