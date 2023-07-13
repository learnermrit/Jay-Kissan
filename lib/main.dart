import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:jay_kissan/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:jay_kissan/firebase_options.dart';
import 'package:jay_kissan/repository/authentication_repositry/authentication_repository.dart';
import 'package:jay_kissan/utils/theme/theme.dart';

import 'features/authentication/screens/login/login_screen.dart';
import 'features/authentication/screens/signup/signup_screen.dart';
import 'features/authentication/screens/welcome/welcome_screen.dart';
import 'features/core/screens/dashboard/dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 1000),
      themeMode: ThemeMode.system,
      home: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // Handle initialization error
              return Center(
                  child:
                      Text('Error initializing Firebase: ${snapshot.error}'));
            }
            // Initialize the AuthenticationRepository and check the initial screen
            Get.put(AuthenticationRepository());
            return GetBuilder<AuthenticationRepository>(
              builder: (controller) {
                return controller.firebaseUser.value != null
                    ? const Dashboard()
                    : WelcomeScreen();
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while Firebase is being initialized
            return CircularProgressIndicator();
          } else {
            // Handle other connection states
            return Center(child: Text('Initializing Firebase...'));
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
        leading: const Icon(Icons.ondemand_video),
      ),

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Heading',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'sub-Heading',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Paragraph',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated Button"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Buttton'),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Image(image: AssetImage("assets/images/books.png")),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
