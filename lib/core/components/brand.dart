import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrandApp {
  static const Widget brandText = Row(
    mainAxisSize: MainAxisSize.min, // Supaya ukurannya menyesuaikan isi
    children: [
      Text(
        'Code With Rafi',
        style: TextStyle(fontSize: 10, color: Color(0xff3949AB)),
      ),
      SizedBox(width: 8), // Jarak antara teks dan ikon
      Icon(Icons.check),
    ],
  );
}
