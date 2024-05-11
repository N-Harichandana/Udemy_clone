import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import '/providers/cart.dart';
import '/screens/course_desc.dart';
import '/screens/login.dart';
import '/providers/auth.dart';
import '/providers/courses.dart';
import '/screens/cart_screen.dart';
import '/screens/mainscreen.dart';
import '/screens/signup.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey =
      "pk_test_51PDjCFSIlvxZxK97835vo9M1KP58UvxLxrXs1ohTsCnIpJbH3ScPT3xkmXtfKnkYCGxaR695IoagA2PRWOL6suFm00OdeQdv31";
  Stripe.merchantIdentifier = 'any string works';
  await Stripe.instance.applySettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Courses(),
        ),
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My App',
          home: auth.isAuth
              ? const MainScreen()
              : FutureBuilder(
                  future: auth.tryautoLogin(),
                  builder: (ctx, authResultSanpshot) =>
                      authResultSanpshot.connectionState ==
                              ConnectionState.waiting
                          ? Login()
                          : Login()),
          routes: {
            Login.id: (context) => Login(),
            Signup.id: (context) => Signup(),
            MainScreen.id: (context) => MainScreen(),
            CourseDescription.id: (context) => CourseDescription(),
          },
        ),
      ),
    );
  }
}
