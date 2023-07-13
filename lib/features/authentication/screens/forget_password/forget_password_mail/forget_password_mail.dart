import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jay_kissan/common_widgets/form/form_header_widget.dart';
import 'package:jay_kissan/constants/image_strings.dart';
import 'package:jay_kissan/constants/sizes.dart';
import 'package:jay_kissan/constants/text_strings.dart';
import 'package:jay_kissan/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                SizedBox(
                  height: tDefaultSize * 4,
                ),
                form_header_widget(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    heightBetween: 30.0,
                    textAlign: TextAlign.center,
                    image: tForgorPasswordImage,
                    title: tForgetPassword,
                    subtitle: tForgetMailSubtitle),
                SizedBox(
                  height: 20,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmail,
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                    SizedBox(
                      height: tDefaultSize,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => OtpScreen());
                            },
                            child: Text(tNext +"check"))),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
