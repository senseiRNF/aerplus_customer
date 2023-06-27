import 'package:aerplus_customer/services/network/models/banner_information_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  final BuildContext context;
  final CarouselOptions carouselOptions;
  final String? name;
  final int? point;
  final List<BannerInformationData> bannerList;
  final List<BannerInformationData> newsList;
  final List<BannerInformationData> prizeList;

  const HomeFragment({
    super.key,
    required this.context,
    required this.carouselOptions,
    this.name,
    this.point,
    required this.bannerList,
    required this.newsList,
    required this.prizeList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Hi, ${name ?? 'Unknown User'}",
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '${point ?? 0} Aerplus Point',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: ListView(
            children: [
              CarouselSlider(
                options: carouselOptions,
                items: bannerList.map<Widget>((banner) {
                  return Card(
                    child: CachedNetworkImage(
                      imageUrl: banner.bannerInformationMedia != null && banner.bannerInformationMedia!.isNotEmpty ? banner.bannerInformationMedia![0].originalUrl ?? '' : '',
                      placeholder: (BuildContext loadingContext, String url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "What's new?",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              CarouselSlider(
                options: carouselOptions,
                items: newsList.map<Widget>((news) {
                  return Card(
                    child: CachedNetworkImage(
                      imageUrl: news.bannerInformationMedia != null && news.bannerInformationMedia!.isNotEmpty ? news.bannerInformationMedia![0].originalUrl ?? '' : '',
                      placeholder: (BuildContext loadingContext, String url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Prize",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              CarouselSlider(
                options: carouselOptions,
                items: prizeList.map<Widget>((prize) {
                  return Card(
                    child: CachedNetworkImage(
                      imageUrl: prize.bannerInformationMedia != null && prize.bannerInformationMedia!.isNotEmpty ? prize.bannerInformationMedia![0].originalUrl ?? '' : '',
                      placeholder: (BuildContext loadingContext, String url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}