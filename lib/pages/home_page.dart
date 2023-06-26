import 'package:aerplus_customer/miscellaneous/dialog_functions.dart';
import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/pages/fragments/home_fragment.dart';
import 'package:aerplus_customer/pages/fragments/profile_fragment.dart';
import 'package:aerplus_customer/pages/fragments/qr_fragment.dart';
import 'package:aerplus_customer/pages/splash_page.dart';
import 'package:aerplus_customer/services/local/local_shared_preferences.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String qrCode = "It's just a test";

  int selectedMenu = 0;

  CarouselOptions carouselOptions = CarouselOptions(
    height: 200.0,
  );

  @override
  void initState() {
    super.initState();

    initLoad();
  }

  Future initLoad() async {

  }

  logout() async {
    await OptionDialog(
      context: context,
      content: 'Keluar dari sesi aplikasi, apakah Anda yakin?',
      yesPressed: () async {
        await LocalSharedPreferences.removeAllKey().then((removeResult) {
          if(removeResult == true) {
            RedirectTo(context: context, target: const SplashPage()).go();
          }
        });
      },
    ).show();
  }

  Widget selectedScreen(int selected) {
    switch(selected) {
      case 0:
        return HomeFragment(
          context: context,
          carouselOptions: carouselOptions,
        );
      case 2:
        return QRFragment(
          context: context,
          qrCode: qrCode,
          onRefresh: () => initLoad(),
        );
      case 4:
        return ProfileFragment(
          context: context,
          onLogout: () => logout(),
          onRefresh: () => initLoad(),
        );
      default:
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Menu Not Found',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'You supposed to not to seeing this page\nPlease contact Administrator.',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: selectedScreen(selectedMenu),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedMenu = index;
          });
        },
        currentIndex: selectedMenu,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            label: 'Depot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Reward',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}