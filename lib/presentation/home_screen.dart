import 'package:flutter/material.dart';
import 'package:slicing_romadon/core/components/app_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> ticketList = [
    {'name': 'Ticket Dewasa VIP', 'price': 50000},
    {'name': 'Ticket Anak VIP', 'price': 100000},
    {'name': 'Ticket Lansia VIP', 'price': 150000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 64),
            child: Center(
              child: Text(
                'Penjualan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff3949AB),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: ticketList.length,
              itemBuilder: (context, index) {
                return AppCard(
                  ticketName: ticketList[index]['name'],
                  ticketPrice: ticketList[index]['price'],
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
