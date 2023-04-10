import 'package:adv_final_exam/Helper/collection_helper.dart';
import 'package:adv_final_exam/Model/login_model.dart';
import 'package:adv_final_exam/Utils/color.dart';
import 'package:adv_final_exam/View/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: signInKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Log In",
                  style: GoogleFonts.poppins(fontSize: 30),
                ),
                const SizedBox(height: 100),
                TextFormField(
                  controller: Global.signInEmail,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter the Email";
                    }
                    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(val)) {
                      return "Enter Valid a Email";
                    }
                  },
                  style: GoogleFonts.poppins(color: MyColor.black),
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    errorStyle: GoogleFonts.poppins(),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: Global.signInPass,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter the Password";
                    }
                    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(val)) {
                      return "Please Enter a Valid password";
                    }
                  },
                  style: GoogleFonts.poppins(color: MyColor.black),
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    errorStyle: GoogleFonts.poppins(),
                  ),
                ),
                const SizedBox(height: 100),
                CupertinoButton.filled(
                  child: const Text("Log IN"),
                  onPressed: () {
                    if (signInKey.currentState!.validate()) {
                      Get.off(() => const Homepage());
                      LoginUser loginUser = LoginUser(email: Global.signInEmail.text, pass: Global.signInPass.text);
                      CollectionHelper.instance.addUser(loginUser);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
