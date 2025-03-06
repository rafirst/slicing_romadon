import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Merk {
  static Widget textMerk = Column(
    children: [
            Text(
              'Slicing Romadon',
              style: GoogleFonts.montserrat(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
             Text(
            'Semangat Menjalankan Tugas',
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Colors.white
            ),
          ),
    ],
  );
}
