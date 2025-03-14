import 'package:flutter/material.dart';
import 'package:slicing_romadon/core/components/app_button.dart';
import 'package:slicing_romadon/core/components/app_card.dart';
import 'package:slicing_romadon/data/models/ticket_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TicketModel> ticketDummy = [
    TicketModel(
      title: 'Tiket Masuk Dewasa',
      subtitle: 'Nusantara',
      price: 50000,
    ),
    TicketModel(
      title: 'Tiket Masuk Anak',
      subtitle: 'Nusantara',
      price: 20000,
    ),
    TicketModel(
      title: 'Tiket Masuk Dewasa',
      subtitle: 'Mancanegara',
      price: 150000,
    ),
    TicketModel(
      title: 'Tiket Masuk Anak',
      subtitle: 'Mancanegara',
      price: 40000,
    ),
    TicketModel(
      title: 'Tiket Masuk Dewasa',
      subtitle: 'Mancanegara',
      price: 150000,
    ),
  ];

  int totalAmount = 0;

  void updateTotalPrice() {
    setState(() {
      totalAmount = ticketDummy.fold(
        0,
        (sum, ticket) => sum + (ticket.price * ticket.count),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              itemCount: ticketDummy.length,
              itemBuilder: (context, index) {
                var data = ticketDummy[index];
                return AppCard(
                  title: data.title,
                  subtitle: data.subtitle,
                  price: data.price,
                  count: data.count,
                  onIncrement: () {
                    setState(() {
                      data.count++;
                      updateTotalPrice(); // Update total harga
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (data.count > 0) {
                        data.count--;
                        updateTotalPrice();
                      }
                    });
                  },
                );
              },
            ),
          ),

          Container(
            width: double.infinity,
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 36,
                      horizontal: 24,
                    ),
                    child: Column(
                      children: [
                        Text('Order Summary'),
                        SizedBox(height: 4),
                        Text(
                          'Rp ${totalAmount.toString()}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 36,
                    horizontal: 24,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 143,
                        height: 48,
                        child: AppButton(
                          text: 'Process',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/detail-order',
                              arguments: {
                                'products': ticketDummy,
                                'totalHarga': totalAmount,
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
