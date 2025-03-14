import 'package:flutter/material.dart';
import 'package:slicing_romadon/core/components/app_colors.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {

 
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/square.png'),
          ),
        ],
        title: Text(
          'Kelola Ticket',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.mainColor,
          ),
        ),
      ),
      
    );
  }
}
