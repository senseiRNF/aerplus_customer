import 'package:aerplus_customer/miscellaneous/dialog_functions.dart';
import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/services/local/local_shared_preferences.dart';
import 'package:aerplus_customer/services/local/models/local_register_model.dart';
import 'package:aerplus_customer/services/network/init_services.dart';
import 'package:aerplus_customer/services/network/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIAuthorizationService {
  BuildContext context;

  APIAuthorizationService({required this.context});

  Future<bool> loginSystem(String username, String password) async {
    bool result = false;

    await InitServices.init().then((dio) async {
      LoadingDialog(context: context).show();

      try {
        await dio.post(
          '/api/login',
          data: {
            'login': username,
            'password': password,
          },
        ).then((postResult) async {
          LoginModel loginModel = LoginModel.fromJson(postResult.data);

          if(loginModel.loginData != null) {
            await LocalSharedPreferences.writeKey(LocalSPKeys.accessTokenKey, loginModel.loginData!.accessToken ?? '').then((_) async {
              await LocalSharedPreferences.writeKey(LocalSPKeys.userIdKey, "${loginModel.loginData!.id ?? ''}").then((_) async {
                await LocalSharedPreferences.writeKey(LocalSPKeys.nameKey, loginModel.loginData!.name ?? '').then((_) async {
                  await LocalSharedPreferences.writeKey(LocalSPKeys.usernameKey, loginModel.loginData!.username ?? '').then((_) async {
                    await LocalSharedPreferences.writeKey(LocalSPKeys.emailKey, loginModel.loginData!.email ?? '').then((_) async {
                      result =  true;

                      CloseBack(context: context).go();
                    });
                  });
                });
              });
            });
          }
        });
      } on DioException catch(dioExc) {
        CloseBack(context: context).go();

        ErrorHandler(context: context, dioExc: dioExc, isLoginForm: true).show();
      }
    });

    return result;
  }

  Future<bool> registerAccount(LocalRegisterModel data) async {
    bool result = false;

    await InitServices.init().then((dio) async {
      LoadingDialog(context: context).show();

      try {
        await dio.post(
          '/api/register',
          data: {
            'username': data.username,
            'password': data.password,
            'email': data.email,
            'name': data.name,
            'dob': data.dob,
            'address': data.address,
            'phone': data.phone,
            'depot_id': data.depotId,
          },
        ).then((postResult) async {
          result =  true;

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