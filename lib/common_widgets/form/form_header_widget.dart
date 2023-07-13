import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class form_header_widget extends StatelessWidget {
  const form_header_widget({
    super.key,
    required this.image,
    this.heightBetween = 0,
    required this.title,
    this.textAlign,
    required this.subtitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String image, title, subtitle;
  final double heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * 0.2,
        ),
        SizedBox(
          height: heightBetween,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        Text(
          subtitle,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
