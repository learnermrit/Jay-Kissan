import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jay_kissan/constants/image_strings.dart';
import 'package:jay_kissan/constants/sizes.dart';
import 'package:jay_kissan/constants/text_strings.dart';

import '../../../../common_widgets/form/form_header_widget.dart';
import 'login_footer_widget.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //sction-1
                form_header_widget(
                  image: tWelcomeScreenImage,
                  title: tLoginTitle,
                  subtitle: tLoginSubTitle,
                ),

                //section 2
                LoginForm(),

                //section 3
                LoginFooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
