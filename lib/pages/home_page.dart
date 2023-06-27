import 'package:aerplus_customer/miscellaneous/dialog_functions.dart';
import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/pages/fragments/depot_fragment.dart';
import 'package:aerplus_customer/pages/fragments/home_fragment.dart';
import 'package:aerplus_customer/pages/fragments/profile_fragment.dart';
import 'package:aerplus_customer/pages/fragments/qr_fragment.dart';
import 'package:aerplus_customer/pages/splash_page.dart';
import 'package:aerplus_customer/services/local/local_shared_preferences.dart';
import 'package:aerplus_customer/services/network/banner_information_services/api_banner_info_service.dart';
import 'package:aerplus_customer/services/network/depot_services/api_depot_service.dart';
import 'package:aerplus_customer/services/network/models/banner_information_model.dart';
import 'package:aerplus_customer/services/network/models/depot_model.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CarouselOptions carouselOptions = CarouselOptions(
    height: 200.0,
  );

  TextEditingController searchController = TextEditingController();

  String qrCode = "It's just a test";
  String? name;
  String? email;

  int selectedMenu = 0;

  DepotModel? depotModel;

  List<DepotData> sortedDepotList = [];
  List<BannerInformationData> bannerList = [];
  List<BannerInformationData> newsList = [];
  List<BannerInformationData> prizeList = [];

  @override
  void initState() {
    super.initState();

    loadPage().then((_) {
      loadDepot().then((_) {
        loadBannerInformation();
      });
    });
  }

  Future loadPage() async {
    await LocalSharedPreferences.readKey(LocalSPKeys.nameKey).then((nameResult) async {
      await LocalSharedPreferences.readKey(LocalSPKeys.emailKey).then((emailResult) {
        setState(() {
          name = nameResult;
          email = emailResult;
        });
      });
    });
  }

  Future loadDepot() async {
    await APIDepotService(context: context).showDepot().then((result) {
      if(result != null) {
        List<DepotData> tempSortedDepotList = [];

        if(result.depotData != null) {
          for(int i = 0; i < result.depotData!.length; i++) {
            if(searchController.text == '') {
              tempSortedDepotList.add(result.depotData![i]);
            } else {
              if(result.depotData![i].name != null && result.depotData![i].name!.toUpperCase().contains(searchController.text.toUpperCase())) {
                tempSortedDepotList.add(result.depotData![i]);
              }
            }
          }
        }

        setState(() {
          depotModel = result;
          sortedDepotList = tempSortedDepotList;
        });
      }
    });
  }

  Future loadBannerInformation() async {
    await APIBannerInfoService(context: context).showBanner().then((result) {
      List<BannerInformationData> tempBannerList = [];
      List<BannerInformationData> tempNewsList = [];
      List<BannerInformationData> tempPrizeList = [];

      if(result != null && result.bannerInformationData != null) {
        for(int i = 0; i < result.bannerInformationData!.length; i++) {
          switch(result.bannerInformationData![i].type) {
            case 'Banner':
              tempBannerList.add(result.bannerInformationData![i]);
              break;
            case 'News':
              tempNewsList.add(result.bannerInformationData![i]);
              break;
            case 'List Hadiah':
              tempPrizeList.add(result.bannerInformationData![i]);
              break;
            default:
              break;
          }
        }
      }

      setState(() {
        bannerList = tempBannerList;
        newsList = tempNewsList;
        prizeList = tempPrizeList;
      });
    });
  }

  searchDepot(String query) {
    List<DepotData> tempSortedDepotList = [];

    if(depotModel != null && depotModel!.depotData != null) {
      for(int i = 0; i < depotModel!.depotData!.length; i++) {
        if(query == '') {
          tempSortedDepotList.add(depotModel!.depotData![i]);
        } else {
          if(depotModel!.depotData![i].name != null && depotModel!.depotData![i].name!.toUpperCase().contains(query.toUpperCase())) {
            tempSortedDepotList.add(depotModel!.depotData![i]);
          }
        }
      }
    }

    setState(() {
      sortedDepotList = tempSortedDepotList;
    });
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
          name: name,
          bannerList: bannerList,
          newsList: newsList,
          prizeList: prizeList,
        );
      case 1:
        return DepotFragment(
          context: context,
          searchController: searchController,
          depotList: sortedDepotList,
          onQuerySearch: (query) => searchDepot(query),
          onSelectDepot: () {},
          onRefresh: () => loadDepot(),
        );
      case 2:
        return QRFragment(
          context: context,
          qrCode: qrCode,
          onRefresh: () => loadPage(),
        );
      case 4:
        return ProfileFragment(
          context: context,
          name: name,
          email: email,
          onLogout: () => logout(),
          onRefresh: () => loadPage(),
        );
      default:
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Menu Tidak Dapat Ditampilkan',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Terjadi kesalahan saat memuat halaman\nHarap hubungi Administrator untuk informasi lebih lanjut.',
              style: TextStyle(
                fontSize: 14.0,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: selectedScreen(selectedMenu),
            ),
          ],
        ),
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