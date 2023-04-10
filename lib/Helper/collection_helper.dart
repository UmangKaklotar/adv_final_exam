import 'package:adv_final_exam/Model/login_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/user_model.dart';

class CollectionHelper {
  static CollectionHelper instance = CollectionHelper();

  CollectionReference user = FirebaseFirestore.instance.collection('user');
  CollectionReference login = FirebaseFirestore.instance.collection('login');

  addUser(LoginUser loginUser) async {
    return login.add(loginUser.toMap()).then((value) => print("User Added..")).catchError((error) => print("Failed to add user: $error"));
  }

  insertData(UserData userData) async {
    return user.add(userData.toMap()).then((value) => print("User Added..")).catchError((error) => print("Failed to add user: $error"));
  }

  updateData({required int index, required UserData userData}) async {
    var docSnap = await user.get();
    var doc_id = docSnap.docs;
    return user.doc(doc_id[index].id).update(userData.toMap()).then((value) => print("User Updated..")).catchError((error) => print("Failed to update user: $error"));
  }

  deleteData({required int index}) async {
    var docSnap = await user.get();
    var doc_id = docSnap.docs;
    return user.doc(doc_id[index].id).delete().then((value) => print("User Deleted..")).catchError((error) => print("Failed to delete user: $error"));
  }
}
