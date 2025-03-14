  import 'package:flutter/material.dart';
  import 'package:slicing_romadon/presentation/detail_order_screen.dart';
  import 'package:slicing_romadon/presentation/main_screen.dart';
  import 'package:slicing_romadon/presentation/splashing_screen.dart';
  import 'package:slicing_romadon/presentation/login_screen.dart';

  void main() {
  runApp(const SlicingApp());
}


  class SlicingApp extends StatelessWidget {
    const SlicingApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashingScreen(),
          '/login': (context) => LoginScreen(),
          '/main-screen': (context) => MainScreen(),
          '/detail-order': (context) => DetailOrderScreen()
        },
      );
    }
  }
