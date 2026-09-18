import 'package:cloud_firestore/cloud_firestore.dart';

// class SearchUser {
//   Future<QuerySnapshot> search(String username) async {
//     return  await FirebaseFirestore.instance
//         .collection("users")
//         .where("userName", isEqualTo: username.substring(0, 1).toUpperCase())
//         .get();
//   }
// }

// class SearchUser {
//   Future<QuerySnapshot> search(String username) async {
//     final value = username.trim();

//     return FirebaseFirestore.instance
//         .collection("users")
//         .orderBy("userName")
//         .startAt([value]).endAt(["$value\uf8ff"]).get();
//   }
// }

class SearchUser {
  Future<QuerySnapshot> search(String username) async {
    final value = username.trim();

    return FirebaseFirestore.instance
        .collection("users")

        //remember to change to userName
        .orderBy("fullName")
        .startAt([value]).endAt(["$value\uf8ff"]).get();
  }
}
