import 'package:flutter/material.dart';
import 'package:slicing_romadon/core/components/app_card.dart';

class DetailOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments
            as List<Map<String, dynamic>>?;

    return Scaffold(
      appBar: AppBar(title: Text("Detail Pemesanan")),
      body:
          arguments == null || arguments.isEmpty
              ? Center(child: Text("Tidak ada tiket yang dipilih"))
              : ListView.builder(
                itemCount: arguments.length,
                itemBuilder: (context, index) {
                  final ticket = arguments[index];
                  final String ticketName = ticket['name'] ?? 'Unknown';
                  final int count = ticket['count'] ?? 0;
                  final int price = ticket['price'] ?? 0;

                  return AppCard(
                    ticketName: ticketName,
                    priceTicket: price, // Harga satuan
                    count: count,
                    index: index,
                  );
                },
              ),
    );
  }
}
