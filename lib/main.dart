import 'package:adv_final_exam/Utils/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'View/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.poppins(
          color: MyColor.black,
        ),
        textTheme: TextTheme(bodyText2: GoogleFonts.poppins(color: MyColor.black)),
      )),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}
