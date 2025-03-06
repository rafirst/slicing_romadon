import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_romadon/core/components/brand.dart';

class SplashingScreen extends StatefulWidget {
  const SplashingScreen({super.key});

  @override
  State<SplashingScreen> createState() => _SplashingScreenState();
}



class _SplashingScreenState extends State<SplashingScreen> {
  @override

    void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () { // Durasi splash screen
      Navigator.pushReplacementNamed(context, '/login'); 
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Slicing Romadon',
              style: GoogleFonts.montserrat(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Color(0xff3949AB),
              ),
            ),
          ),

          Text(
            'Semangat Menjalankan Tugas',
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 150),
        child: BrandApp.brandText,
      ),
    );
  }
}
