import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jay_kissan/repository/authentication_repositry/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

//TextFeild controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }
}
