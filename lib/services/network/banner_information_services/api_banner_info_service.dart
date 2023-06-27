import 'package:aerplus_customer/miscellaneous/dialog_functions.dart';
import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/services/local/local_shared_preferences.dart';
import 'package:aerplus_customer/services/network/init_services.dart';
import 'package:aerplus_customer/services/network/models/banner_information_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIBannerInfoService {
  BuildContext context;

  APIBannerInfoService({required this.context});

  Future<BannerInformationModel?> showBanner() async {
    BannerInformationModel? result;

    await LocalSharedPreferences.readKey(LocalSPKeys.accessTokenKey).then((token) async {
      await InitServices.init().then((dio) async {
        LoadingDialog(context: context).show();

        try {
          await dio.get(
            '/api/loyalty',
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ),
          ).then((getResult) async {
            result = BannerInformationModel.fromJson(getResult.data);

            CloseBack(context: context).go();
          });
        } on DioException catch(dioExc) {
          CloseBack(context: context).go();

          ErrorHandler(context: context, dioExc: dioExc, isLoginForm: true).show();
        }
      });
    });

    return result;
  }
}