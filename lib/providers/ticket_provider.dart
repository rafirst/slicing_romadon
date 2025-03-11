import 'package:flutter/material.dart';

class TicketProvider extends ChangeNotifier {
  final Map<int, int> _ticketCounts = {}; // Menyimpan jumlah tiket tiap index

  int getAddTicket(int index) => _ticketCounts[index] ?? 0;

  void penambahan(int index) {
    _ticketCounts[index] = (_ticketCounts[index] ?? 0) + 1;
    notifyListeners();
  }

  void pengurangan(int index) {
    if (_ticketCounts.containsKey(index) && _ticketCounts[index]! > 0) {
      _ticketCounts[index] = _ticketCounts[index]! - 1;
      if (_ticketCounts[index] == 0) {
        _ticketCounts.remove(index);
      }
      notifyListeners();
    }
  }

  int getTotalPrice(List<Map<String, dynamic>> ticketList) {
    int total = 0;
    _ticketCounts.forEach((index, count) {
      total += (ticketList[index]['price'] as int) * count;
    });
    return total;
  }

  // Fungsi untuk mendapatkan daftar tiket yang dipilih
  List<Map<String, dynamic>> getSelectedTickets(List<Map<String, dynamic>> ticketList) {
  List<Map<String, dynamic>> selectedTickets = [];
  _ticketCounts.forEach((index, count) {
    if (count > 0) {
      selectedTickets.add({
        'name': ticketList[index]['name'],
        'price': ticketList[index]['price'],
        'quantity': count, // Gunakan `quantity` agar sesuai dengan DetailOrderScreen
        'totalPrice': ticketList[index]['price'] * count, // Hitung total harga
      });
    }
  });
  return selectedTickets;
}

}
