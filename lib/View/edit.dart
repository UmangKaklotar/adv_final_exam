import 'package:adv_final_exam/Helper/collection_helper.dart';
import 'package:adv_final_exam/Model/user_model.dart';
import 'package:adv_final_exam/Utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  GlobalKey<FormState> edit = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.name.clear();
    Global.age.clear();
    Global.role.clear();
    Global.phone.clear();
  }

  @override
  Widget build(BuildContext context) {
    int? index = ModalRoute.of(context)?.settings.arguments as int?;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Global.name.text = Global.data[index!]['name'];
      Global.age.text = Global.data[index]['age'].toString();
      Global.role.text = Global.data[index]['role'];
      Global.phone.text = Global.data[index]['phone'];
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashRadius: 25,
          icon: Icon(CupertinoIcons.back, color: MyColor.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          (index.isNull) ? "Add User" : "Edit User",
          style: const TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: edit,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                controller: Global.name,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter the Name";
                  }
                },
                style: GoogleFonts.poppins(color: MyColor.black),
                decoration: InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  errorStyle: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: Global.age,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter the Age";
                  }
                },
                style: GoogleFonts.poppins(color: MyColor.black),
                decoration: InputDecoration(
                  hintText: "Age",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  errorStyle: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: Global.role,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter the Role";
                  }
                },
                style: GoogleFonts.poppins(color: MyColor.black),
                decoration: InputDecoration(
                  hintText: "Role",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  errorStyle: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: Global.phone,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter the Phone";
                  }
                },
                style: GoogleFonts.poppins(color: MyColor.black),
                decoration: InputDecoration(
                  hintText: "Phone",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  errorStyle: GoogleFonts.poppins(),
                ),
              ),
              const SizedBox(height: 50),
              CupertinoButton.filled(
                child: Text((index.isNull) ? "Add" : "Update"),
                onPressed: () {
                  if (edit.currentState!.validate()) {
                    UserData userData = UserData(name: Global.name.text, age: int.parse(Global.age.text), phone: Global.phone.text, role: Global.role.text);
                    if (index.isNull) {
                      CollectionHelper.instance.insertData(userData);
                    } else {
                      CollectionHelper.instance.updateData(index: index!, userData: userData);
                    }
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
