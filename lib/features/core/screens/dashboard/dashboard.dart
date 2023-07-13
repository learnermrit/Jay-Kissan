import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jay_kissan/constants/colors.dart';
import 'package:jay_kissan/constants/image_strings.dart';
import 'package:jay_kissan/constants/sizes.dart';
import 'package:jay_kissan/constants/text_strings.dart';
import 'package:jay_kissan/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:jay_kissan/features/core/screens/dashboard/widgets/banners.dart';
import 'package:jay_kissan/features/core/screens/dashboard/widgets/categories.dart';
import 'package:jay_kissan/features/core/screens/dashboard/widgets/search.dart';
import 'package:jay_kissan/repository/authentication_repositry/authentication_repository.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    //variables
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(tDashboardTitle, style: txtTheme.bodyText2),
            Text(tDashboardHeading, style: txtTheme.headline2),
            const SizedBox(height: tDashboardPadding),

            // Search box
            Searchbox(txtTheme: txtTheme),
            const SizedBox(height: tDashboardPadding),
            //categories
            DashboardCategories(txtTheme: txtTheme),
            //banners
            DashboardBanners(txtTheme: txtTheme),
            const SizedBox(
              height: tDashboardPadding,
            ),

            //top Courses
            Text(
              tDashboardTopCourses,
              style: txtTheme.headline4?.apply(fontSizeFactor: 1.2),
            ),
            SizedBox(
              height: 200,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 320,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tCardBgColor),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Text(
                                  'Flutter Crash Course',
                                  style: txtTheme.headline4,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                const Flexible(
                                    child: Image(
                                  image: AssetImage(tdashboaedbook),
                                  height: 110,
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder()),
                                  onPressed: () {},
                                  child: Icon(Icons.play_arrow),
                                ),
                                const SizedBox(
                                  width: tDashboardCardPadding,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '3 Sections',
                                      style: txtTheme.headline4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Programing Language',
                                      style: txtTheme.bodyText2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
