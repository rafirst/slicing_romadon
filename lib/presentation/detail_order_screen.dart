import 'package:flutter/material.dart';
import 'package:slicing_romadon/core/components/app_colors.dart';
import 'package:slicing_romadon/data/models/ticket_model.dart';

class DetailOrderScreen extends StatefulWidget {
  const DetailOrderScreen({super.key});

  @override
  State<DetailOrderScreen> createState() => _DetailOrderScreenState();
}

class _DetailOrderScreenState extends State<DetailOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main-screen');
          },
          icon: Icon(Icons.arrow_back),
          color: AppColors.mainColor,
        ),
        title: Text(
          'Order Detail',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.mainColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Container(
          height: 160,
          width: 327,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: arguments['products']?.length ?? 0, // Sesuaikan key
                itemBuilder: (context, index) {
                  final data =
                      arguments['products'][index]
                          as TicketModel; // Sesuaikan key
                  return ListTile(
                    title: Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text(
                      data.subtitle,
                      style: TextStyle(fontSize: 11),
                    ),
                    trailing: Text(
                      'Rp ${data.price}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: Text(
                  arguments['products']
                      .map((ticket) => 'Rp ${ticket.price}')
                      .join(', '), // Gabungkan jadi string
                ),

                trailing: Text(
                  'Rp ${arguments['totalHarga']}',
                ), // Sesuaikan key
              ),
            ],
          ),
        ),
      ),
    );
  }
}
