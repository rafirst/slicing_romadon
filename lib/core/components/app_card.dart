import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slicing_romadon/providers/ticket_provider.dart';

class AppCard extends StatelessWidget {
  final String ticketName;
  final int ticketPrice;
  final int index;

  const AppCard({
    Key? key,
    required this.ticketName,
    required this.ticketPrice,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ticketProvider = Provider.of<TicketProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 121,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
            ),
          ),
          Row(
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
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    Text('Nusantara', style: TextStyle(fontSize: 11)),
                    SizedBox(height: 16),
                    Text(
                      'Rp. ${ticketPrice}',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: ticketProvider.pengurangan,
                        icon: Image.asset('assets/images/minus.png'),
                      ),
                      Text(
                        ticketProvider.addTicket.toString(),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: ticketProvider.penambahan,
                        icon: Image.asset('assets/images/plus.png'),
                      ),
                    ],
                  ),
                  Text(
                    'Rp. ${ticketProvider.addTicket * ticketPrice}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}
