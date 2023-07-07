import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/services/network/models/banner_information_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BannerDisplayPage extends StatefulWidget {
  final BannerInformationData bannerData;

  const BannerDisplayPage({
    super.key,
    required this.bannerData,
  });

  @override
  State<BannerDisplayPage> createState() => _BannerDisplayPageState();
}

class _BannerDisplayPageState extends State<BannerDisplayPage> {
  BannerInformationData? bannerInformationData;

  @override
  void initState() {
    super.initState();

    setState(() {
      bannerInformationData = widget.bannerData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: bannerInformationData != null && bannerInformationData!.bannerInformationMedia != null && bannerInformationData!.bannerInformationMedia!.isNotEmpty ? bannerInformationData!.bannerInformationMedia![0].originalUrl ?? '' : '',
                  imageBuilder: (BuildContext imageContext, ImageProvider imgProvider) {
                    return Image(
                      image: imgProvider,
                      fit: BoxFit.cover,
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
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: Card(
                          shape: const CircleBorder(),
                          child: Material(
                            color: Colors.transparent,
                            shape: const CircleBorder(),
                            child: InkWell(
                              onTap: () => CloseBack(context: context).go(),
                              customBorder: const CircleBorder(),
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.arrow_back,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      bannerInformationData != null ? bannerInformationData!.description ?? 'No Description' : 'No Description',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}