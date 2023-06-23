import 'package:aerplus_customer/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const AerplusCustomerApp());
  });
}

class AerplusCustomerApp extends StatelessWidget {
  const AerplusCustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aerplus Customer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff59b9ab)),
        useMaterial3: true,
        fontFamily: 'Lato',
      ),
      home: const SplashPage(),
    );
  }
}
