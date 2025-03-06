import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slicing_romadon/core/components/merk.dart';
import 'package:slicing_romadon/core/components/app_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3949AB),
      body: Column(
        children: [
          // ✅ Bagian atas dengan background biru
          Expanded(
            flex: 2,
            child: Container(
              color: Color(0xff3949AB),
              alignment:
                  Alignment.topCenter, // 👉 Meletakkan teks di atas tengah
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                ), // Atur jarak dari atas
                child: Merk.textMerk,
              ),
            ),
          ),

          Expanded(
            flex: 4, // Bisa disesuaikan
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 44,
                      horizontal: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: GoogleFonts.outfit(color: Colors.black),
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Masukkan Email',
                            hintStyle: GoogleFonts.outfit(
                              fontWeight: FontWeight.w100,
                              color: Color(0xffADADAD),
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        Text('Password'),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Masukkan Password',
                            hintStyle: GoogleFonts.outfit(
                              fontWeight: FontWeight.w100,
                              color: Color(0xffADADAD),
                            ),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 86),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: AppButton(
                              text: 'Login',
                              onPressed: () {
                                Navigator.pushNamed(context, '/main-screen');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
