import 'package:adv_final_exam/Helper/collection_helper.dart';
import 'package:adv_final_exam/Utils/color.dart';
import 'package:adv_final_exam/View/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "UserData App",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          (Global.signInEmail.text == 'umangkaklotar02@gmail.com')
              ? IconButton(
                  splashRadius: 25,
                  icon: Icon(
                    Icons.add,
                    color: MyColor.black,
                  ),
                  onPressed: () {
                    Get.to(() => const EditPage());
                  },
                )
              : Container(),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went Wrong!!"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(15),
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Global.data = snapshot.data!.docs;
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ExpansionTile(
                    title: Text(
                      "${Global.data[index]['name']}",
                      style: GoogleFonts.poppins(color: MyColor.black),
                    ),
                    subtitle: Text(
                      "${Global.data[index]['role']}",
                      style: GoogleFonts.poppins(color: MyColor.black),
                    ),
                    trailing: (Global.signInEmail.text == 'umangkaklotar02@gmail.com')
                        ? SizedBox(
                            width: 55,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Get.to(() => const EditPage(), arguments: index),
                                  child: Icon(
                                    Icons.edit,
                                    color: MyColor.black,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () => CollectionHelper.instance.deleteData(index: index),
                                  child: Icon(
                                    CupertinoIcons.delete,
                                    color: MyColor.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : null,
                    expandedAlignment: Alignment.centerLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding: const EdgeInsets.all(10),
                    children: [
                      Text(
                        "Age : ${Global.data[index]['age']}",
                      ),
                      Text(
                        "Mobile No : ${Global.data[index]['phone']}",
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
