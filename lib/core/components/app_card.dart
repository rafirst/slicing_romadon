import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slicing_romadon/providers/ticket_provider.dart';

class AppCard extends StatelessWidget {
  final String ticketName;
  final int priceTicket;
  final int index;
  final int count;

  const AppCard({
    Key? key,
    required this.ticketName,
    required this.priceTicket,
    required this.index,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Container(
              height: 121,
              width: 327,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 21,
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticketName,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text('Nusantara', style: TextStyle(fontSize: 11)),
                    SizedBox(height: 16),
                    Consumer<TicketProvider>(
                      builder: (context, ticketProvider, child) {
                        int currentCount = ticketProvider.getAddTicket(index);
                        int totalPrice =
                            currentCount * priceTicket; // Harga dihitung ulang

                        return Text(
                          'Rp. ${totalPrice}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Provider.of<TicketProvider>(
                              context,
                              listen: false,
                            ).pengurangan(index);
                          },
                          icon: Image.asset('assets/images/minus.png'),
                        ),
                        Consumer<TicketProvider>(
                          builder: (context, ticketProvider, child) {
                            return Text(
                              ticketProvider.getAddTicket(index).toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<TicketProvider>(
                              context,
                              listen: false,
                            ).penambahan(index);
                          },
                          icon: Image.asset('assets/images/plus.png'),
                        ),
                      ],
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
