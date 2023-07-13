import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repositry/authentication_repository.dart';

class MailVerificationController extends GetxController {
  late Timer _timer;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sendVerificationEmail();
    // setTimerForAutoRedirect();
  }

  ///-- Send or Resend Email Verification
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      print(e);
    }
  }

  ///-- Set Timer to check if verification Completed than Redirect
  void setTimerForAutoRedirect() {
    // _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //   FirebaseAuth.instance.currentUser?.reload();
    //   final user = FirebaseAuth.instance.currentUser;
    //   if (user!.emailVerified) {
    //     timer.cancel();
    //     AuthenticationRepository.instance.setInitialScreen(user);
    //   }
    // });
  }

  /// -- Manually check if verification completed then redirect
  void manuallyCheckEmailVerificationStatus() {}
}
