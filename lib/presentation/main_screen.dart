import 'package:flutter/material.dart';
import 'package:slicing_romadon/presentation/history_screen.dart';
import 'package:slicing_romadon/presentation/home_screen.dart';
import 'package:slicing_romadon/presentation/setting_screen.dart';
import 'package:slicing_romadon/presentation/ticket_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[pagePosition],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Colors.blueAccent),
        unselectedItemColor: Colors.black,
        selectedItemColor: Color(0xff3949AB),
        currentIndex: pagePosition,
        onTap:
            (index) => setState(() {
              pagePosition = index;
            }),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/ticket.png'),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/history.png'),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/setting.png'),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}

List screen = [HomeScreen(), TicketScreen(), HistoryScreen(), SettingScreen()];
