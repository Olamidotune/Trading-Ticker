import 'package:cloud_firestore/cloud_firestore.dart';

class SearchUser {
  Future<QuerySnapshot> search(String username) async {
    // final value = username.trim().toUpperCase();
    // return FirebaseFirestore.instance
    //     .collection("users")
    //     //remember to change to userName
    //     .orderBy("fullName")
    //     .startAt([value]).endAt(["$value\uf8ff"]).get();

    return await FirebaseFirestore.instance
        .collection("users")
        .where("fullName")
        .get();
  }
}
