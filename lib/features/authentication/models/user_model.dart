import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneno;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneno,
  });
  //fire store data in json format so we need to change it
  toJson() {
    return {
      "id": id,
      "FullName": fullName,
      "Email": email,
      "Phone": phoneno,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        email: data?["Email"],
        password: data?["Password"],
        fullName: data?["FullName"],
        phoneno: data?["Phone"]);
  }
}
