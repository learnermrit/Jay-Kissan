import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jay_kissan/features/core/screens/dashboard/dashboard.dart';
import 'package:jay_kissan/repository/authentication_repositry/authentication_repository.dart';

import '../../../repository/user repository/user_repository.dart';
import '../models/user_model.dart';
import '../screens/forget_password/forget_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

//TextFeild controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());
//call the fnction from design and it will do all things
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    //phoneAuthentication(user.phoneno);
    // Get.to(() => const OTPScreen()); // to get otp verification
    Get.to(() => const Dashboard());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
