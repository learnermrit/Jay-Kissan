import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jay_kissan/features/authentication/controllers/login_controller.dart';
import 'package:jay_kissan/features/core/screens/dashboard/dashboard.dart';
import 'package:jay_kissan/repository/authentication_repositry/authentication_repository.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../forget_password/forget_password_options/forget_password_btn_widget.dart';
import '../forget_password/forget_password_options/forget_password_modal_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller.email,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: tEmail,
                hintText: tEmail,
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: tDefaultSize - 20,
          ),
          TextFormField(
            controller: controller.password,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
          ),
          const SizedBox(
            height: tDefaultSize - 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                ForgetPasswordScreen.buildShowModalBottomSheet(context);
              },
              child: const Text(tForgetPassword),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  String email = controller.email.text.trim();
                  String password = controller.password.text.trim();
                  AuthenticationRepository.instance
                      .loginUserWithEmailAndPassword(email, password);
                },
                child: Text(tLogin.toUpperCase())),
          ),
        ],
      ),
    ));
  }
}
