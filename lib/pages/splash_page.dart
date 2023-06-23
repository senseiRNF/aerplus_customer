import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/pages/home_page.dart';
import 'package:aerplus_customer/pages/login_page.dart';
import 'package:aerplus_customer/services/local/local_shared_preferences.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    load();
  }

  Future load() async {
    await LocalSharedPreferences.readKey(LocalSPKeys.accessTokenKey).then((token) {
      if(token != null) {
        Future.delayed(const Duration(seconds: 3), () => ReplaceTo(context: context, target: const HomePage()).go());
      } else {
        Future.delayed(const Duration(seconds: 3), () => ReplaceTo(context: context, target: const LoginPage()).go());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}