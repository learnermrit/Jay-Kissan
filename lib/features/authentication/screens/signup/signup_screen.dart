import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jay_kissan/common_widgets/form/form_header_widget.dart';
import 'package:jay_kissan/constants/image_strings.dart';
import 'package:jay_kissan/constants/sizes.dart';
import 'package:jay_kissan/constants/text_strings.dart';
import 'package:jay_kissan/features/authentication/controllers/signup_controller.dart';

import '../../../../constants/colors.dart';
import 'widgets/Signup_footer_widget.dart';
import 'widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              form_header_widget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subtitle: tSignUpSubTitle),
              SignUpFormWidget(),
              SignUpFooterWidget(),
            ],
          ),
        ),
      ),
    ));
  }
}
