import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slicing_romadon/core/components/app_button.dart';
import 'package:slicing_romadon/core/components/app_card.dart';
import 'package:slicing_romadon/providers/ticket_provider.dart';

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
    {'name': 'Ticket Keluarga VIP', 'price': 200000},
  ];

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
              itemCount: ticketList.length,
              itemBuilder: (context, index) {
                return Consumer<TicketProvider>(
                  builder: (context, ticketProvider, child) {
                    return AppCard(
                      ticketName: ticketList[index]['name'],
                      priceTicket: ticketList[index]['price'],
                      count: ticketProvider.getAddTicket(
                        index,
                      ), // Tambahkan jumlah tiket yang dipilih
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 36,
                        horizontal: 24,
                      ),
                      child: Column(
                        children: [
                          Text('Order Summary'),
                          SizedBox(height: 4),
                          Consumer<TicketProvider>(
                            builder: (context, ticketProvider, child) {
                              return Text(
                                'Rp. ${ticketProvider.getTotalPrice(ticketList)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              );
                            },
                          ),
                        ],
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
                                final ticketProvider =
                                    Provider.of<TicketProvider>(
                                      context,
                                      listen: false,
                                    );
                                final selectedTickets = ticketProvider
                                    .getSelectedTickets(ticketList);

                                if (selectedTickets.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Pilih tiket terlebih dahulu!",
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                print(
                                  "Selected Tickets: $selectedTickets",
                                ); // Debugging

                                Navigator.pushNamed(
                                  context,
                                  '/detail-order',
                                  arguments: selectedTickets,
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
        ],
      ),
    );
  }
}
