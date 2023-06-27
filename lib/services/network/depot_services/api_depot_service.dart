import 'package:aerplus_customer/miscellaneous/dialog_functions.dart';
import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/services/network/init_services.dart';
import 'package:aerplus_customer/services/network/models/depot_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIDepotService {
  BuildContext context;

  APIDepotService({required this.context});

  Future<DepotModel?> showDepot() async {
    DepotModel? result;

    await InitServices.init().then((dio) async {
      LoadingDialog(context: context).show();

      try {
        await dio.get(
          '/api/depot',
        ).then((getResult) async {
          result = DepotModel.fromJson(getResult.data);

          CloseBack(context: context).go();
        });
      } on DioException catch(dioExc) {
        CloseBack(context: context).go();

        ErrorHandler(context: context, dioExc: dioExc, isLoginForm: true).show();
      }
    });

    return result;
  }
}