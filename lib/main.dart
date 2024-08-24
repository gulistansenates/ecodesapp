import 'package:ekodlariapp/constants/color.dart';
import 'package:ekodlariapp/screen/favorite.dart';

import 'package:ekodlariapp/screen/splashscreen.dart';
import 'package:ekodlariapp/screen/userpage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: ECode(),
    ),
  );
}

class ECode extends StatelessWidget {
  const ECode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E Codes uygulaması",
      theme: ThemeData(primaryColor: HexColor(colorone)),
      home: SplashScreenWithDelay(),
    );
  }
}

class SplashScreenWithDelay extends StatefulWidget {
  @override
  _SplashScreenWithDelayState createState() => _SplashScreenWithDelayState();
}

class _SplashScreenWithDelayState extends State<SplashScreenWithDelay> {
  @override
  void initState() {
    super.initState();
    _navigateToUserPage(); // Metod adını güncelledik
  }

  _navigateToUserPage() async {
    // Metod adını güncelledik
    await Future.delayed(const Duration(seconds: 1), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              UserPage()), // UserPage sayfasına yönlendiriliyor
    );
  }
  /*_navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
