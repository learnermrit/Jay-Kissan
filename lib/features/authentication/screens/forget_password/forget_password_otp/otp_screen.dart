import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jay_kissan/constants/sizes.dart';
import 'package:jay_kissan/constants/text_strings.dart';
import 'package:jay_kissan/features/authentication/controllers/otp_controller.dart';
import 'package:get/get.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OTPController());

    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              tOtpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              tOtpMessage + "Support@gmail.com",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              keyboardType: TextInputType.number,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifiyOTP(otp);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                   OTPController.instance.verifiyOTP(otp);
                },
                child: const Text(tNext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






//     return SingleChildScrollView(
//       child: Scaffold(
//         body: Container(
//           color: Colors.amber,
//           padding: EdgeInsets.all(tDefaultSize),
//           child: Column(children: [
//             Text(
//               tOtpTitle,
//                
//             ),
//             Text(
//               tOtpSubTitle,
//               style: Theme.of(context).textTheme.headline6,
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Text(
//               tOtpMessage + "Support@gmail.com",
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             OtpTextField(
//               numberOfFields: 6,
//               // fillColor: Colors.black.withOpacity(0.1),
//               filled: true,
//               keyboardType: TextInputType.number,
//               onSubmit: (code) {
//                 print("Otp is => $code");
//               },
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: const Text(tNext),
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
