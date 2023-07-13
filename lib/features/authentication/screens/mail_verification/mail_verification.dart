import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jay_kissan/constants/sizes.dart';
import 'package:jay_kissan/features/authentication/controllers/mail_verification_controller.dart';
import 'package:jay_kissan/repository/authentication_repositry/authentication_repository.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: tDefaultSize * 5,
              left: tDefaultSize,
              right: tDefaultSize,
              bottom: tDefaultSize * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                LineAwesomeIcons.envelope_open,
                size: 100,
              ),
              const SizedBox(
                height: tDefaultSize * 2,
              ),
              Text(
                "Verify Your Email Address",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              Text(
                "We have just Send Email Verification link on your email. Please Check email and click on that link to verify yur Email address",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: tDefaultSize * 2,
              ),
              Text(
                  "if not auto redirected after verification, click on the continue button."),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                    child: Text("Continue"),
                    onPressed: () =>
                        controller.manuallyCheckEmailVerificationStatus()),
              ),
              const SizedBox(
                height: tDefaultSize * 2,
              ),
              TextButton(
                  onPressed: () => Get.to(
                        controller.sendVerificationEmail(),
                      ),
                  child: Text("Resend Link")),
              TextButton(
                onPressed: () => AuthenticationRepository().logout(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LineAwesomeIcons.alternate_long_arrow_left),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Back to login"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
