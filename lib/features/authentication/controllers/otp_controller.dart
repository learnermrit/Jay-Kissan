import 'package:get/get.dart';
import 'package:jay_kissan/features/core/screens/dashboard/dashboard.dart';
import 'package:jay_kissan/repository/authentication_repositry/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifiyOTP(String otp) async {
    var isverified = await AuthenticationRepository.instance.verifyOTP(otp);
    isverified ? Get.offAll(const Dashboard()) : Get.back();
  }
}
