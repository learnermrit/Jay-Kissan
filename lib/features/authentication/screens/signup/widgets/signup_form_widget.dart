import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jay_kissan/features/authentication/models/user_model.dart';
import 'package:jay_kissan/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

import '../../../../../constants/text_strings.dart';
import '../../../controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: InputDecoration(
                  label: Text(tFullname),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.email,
                decoration: InputDecoration(
                  label: Text(tEmail),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.phoneNo,
                decoration: InputDecoration(
                  label: Text(tPhoneno),
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.password,
                decoration: InputDecoration(
                  label: Text(tPassword),
                  prefixIcon: Icon(Icons.password_outlined),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //for email authentication
                          // SignUpController.instance.registerUser(
                          //     controller.email.text.trim(),
                          //     controller.password.text.trim());

                          //for phone no. authentication
                          // SignUpController.instance.phoneAuthentication(
                          //     controller.phoneNo.text.trim());

                          final user = UserModel(
                            email: controller.email.text.trim(),
                            password: controller.password.text.trim(),
                            fullName: controller.fullName.text.trim(),
                            phoneno: controller.phoneNo.text.trim(),
                          );

                          SignUpController.instance.createUser(user);
                        }
                      },
                      child: Text(tSignup.toUpperCase())))
            ],
          )),
    );
  }
}
