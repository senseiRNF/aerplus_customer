import 'package:aerplus_customer/services/network/models/banner_information_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  final BuildContext context;
  final CarouselOptions bannerCarouselOptions;
  final CarouselOptions newsCarouselOptions;
  final CarouselOptions rewardCarouselOptions;
  final String? name;
  final int? point;
  final List<BannerInformationData> bannerList;
  final List<BannerInformationData> newsList;
  final List<BannerInformationData> rewardList;
  final int? bannerCarouselIndex;
  final int? newsCarouselIndex;

  const HomeFragment({
    super.key,
    required this.context,
    required this.bannerCarouselOptions,
    required this.newsCarouselOptions,
    required this.rewardCarouselOptions,
    this.name,
    this.point,
    required this.bannerList,
    required this.newsList,
    required this.rewardList,
    this.bannerCarouselIndex,
    this.newsCarouselIndex,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CarouselSlider(
                      options: bannerCarouselOptions,
                      items: bannerList.map<Widget>((banner) {
                        return CachedNetworkImage(
                          imageUrl: banner.bannerInformationMedia != null && banner.bannerInformationMedia!.isNotEmpty ? banner.bannerInformationMedia![0].originalUrl ?? '' : '',
                          imageBuilder: (BuildContext imageContext, ImageProvider imgProvider) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: imgProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          placeholder: (BuildContext loadingContext, String url) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidget: (BuildContext errorContext, String url, err) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(
                                  Icons.image_not_supported,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 30.0,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  'Gagal Memuat Gambar',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                    bannerList.isNotEmpty ?
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        height: 5.0,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: bannerList.length),
                          itemBuilder: (BuildContext dotContext, int dotIndex) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.5),
                              color: bannerCarouselIndex == dotIndex ? Theme.of(context).colorScheme.primary : Colors.grey,
                            );
                          },
                        ),
                      ),
                    ) :
                    const Material(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Text(
                  "What's New?",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: newsCarouselOptions,
                      items: newsList.map<Widget>((news) {
                        return CachedNetworkImage(
                          imageUrl: news.bannerInformationMedia != null && news.bannerInformationMedia!.isNotEmpty ? news.bannerInformationMedia![0].originalUrl ?? '' : '',
                          imageBuilder: (BuildContext imageContext, ImageProvider imgProvider) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: imgProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          placeholder: (BuildContext loadingContext, String url) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidget: (BuildContext errorContext, String url, err) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Icon(
                                  Icons.image_not_supported,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 30.0,
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                const Text(
                                  'Gagal Memuat Gambar',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                    newsList.isNotEmpty ?
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SizedBox(
                        height: 5.0,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: newsList.length),
                          itemBuilder: (BuildContext dotContext, int dotIndex) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.5),
                              color: newsCarouselIndex == dotIndex ? Theme.of(context).colorScheme.primary : Colors.grey,
                            );
                          },
                        ),
                      ),
                    ) :
                    const Material(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                child: Text(
                  'Tukarkan Point Anda',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CarouselSlider(
                  options: rewardCarouselOptions,
                  items: rewardList.map<Widget>((reward) {
                    return CachedNetworkImage(
                      imageUrl: reward.bannerInformationMedia != null && reward.bannerInformationMedia!.isNotEmpty ? reward.bannerInformationMedia![0].originalUrl ?? '' : '',
                      imageBuilder: (BuildContext imageContext, ImageProvider imgProvider) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                              image: imgProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                      placeholder: (BuildContext loadingContext, String url) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (BuildContext errorContext, String url, err) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Icon(
                              Icons.image_not_supported,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30.0,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Text(
                              'Gagal Memuat Gambar',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}