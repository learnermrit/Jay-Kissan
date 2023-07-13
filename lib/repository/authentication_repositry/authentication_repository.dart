import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jay_kissan/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:jay_kissan/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:jay_kissan/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:jay_kissan/repository/authentication_repositry/exceptions/signup_email_password_faliure.dart';

import '../../features/core/screens/dashboard/dashboard.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

//will be loaded when app launches this fun will be called and set the firebase state
  @override
  void onReady() {
    //Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // _setInitialScreen(firebaseUser.value);
    ever(firebaseUser, _setInitialScreen);
  }

//setting initialize scree onload
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => SplashScreen())
        : Get.offAll(() => Dashboard());
  }

/*-----------------Email & password Sign-in---------------------*/
  /// [EmailAuthentication]- Register
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  /// [EmailAuthentication]- Login
  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFaliure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFaliure();
      print('Exception-${ex.message}');
      throw ex;
    }
  }

  /// [EmailVerification]- Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = "Error in FirebaseAuth";
      throw ex;
    } catch (_) {
      final ex = "Error in FirebaseAuth";
      throw ex;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  /*---------------Fderated identity & social sign in--------------*/
  ///
  // function
  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone no is not valid');
        } else {
          Get.snackbar('Error', 'Smething went wrong');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}
