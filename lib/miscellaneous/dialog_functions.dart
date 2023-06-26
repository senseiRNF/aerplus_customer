import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/pages/splash_page.dart';
import 'package:aerplus_customer/services/local/local_shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OkDialog {
  BuildContext context;
  String? title;
  String content;
  Function? okPressed;
  bool? headIcon;

  OkDialog({
    required this.context,
    this.title,
    required this.content,
    this.okPressed,
    this.headIcon,
  });

  show() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          icon: headIcon != null ?
          headIcon! == true ?
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ) :
          const Icon(
            Icons.dangerous_outlined,
            color: Colors.red,
          ) :
          const Icon(
            Icons.warning,
            color: Colors.yellow,
          ),
          title: Text(
            title != null ? title! : headIcon != null ? headIcon! == true ? 'Success' : 'Failed' : 'Attention',
            style: TextStyle(
              color: title != null ? Colors.black : headIcon != null ? headIcon! == true ? Colors.green : Colors.red : Colors.black,
            ),
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                CloseBack(context: context).go();
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    ).then((_) {
      if(okPressed != null) {
        okPressed!();
      }
    });
  }
}

class OptionDialog {
  BuildContext context;
  String? title;
  String content;
  Function? yesPressed;
  Function? noPressed;

  OptionDialog({
    required this.context,
    this.title,
    required this.content,
    this.yesPressed,
    this.noPressed,
  });

  show() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          icon: const Icon(
            Icons.warning,
            color: Colors.yellow,
          ),
          title: Text(
            title ?? 'Attention',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                CloseBack(context: context, callbackData: false).go();
              },
              child: const Text(
                'No',
              ),
            ),
            TextButton(
              onPressed: () {
                CloseBack(context: context, callbackData: true).go();
              },
              child: const Text(
                'Yes',
              ),
            ),
          ],
        );
      },
    ).then((dialogResult) {
      if(dialogResult != null) {
        if(dialogResult == true) {
          if(yesPressed != null) {
            yesPressed!();
          }
        } else {
          if(noPressed != null) {
            noPressed!();
          }
        }
      }
    });
  }
}

class LoadingDialog {
  BuildContext context;

  LoadingDialog({required this.context});

  show() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return WillPopScope(
          onWillPop: () async => Future.value(false),
          child: const AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Loading data from server, please wait...',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ErrorHandler {
  BuildContext context;
  DioException dioExc;
  bool? isLoginForm;

  ErrorHandler({
    required this.context,
    required this.dioExc,
    this.isLoginForm,
  });

  void show() {
    int? errCode;
    String? errMessage;

    if(dioExc.response != null) {
      errCode = dioExc.response!.statusCode;

      switch(errCode) {
        case 401:
          errMessage = '(401) Unauthorized action. Please try again!';
          break;
        case 404:
          errMessage = '(404) Request not found. For more information, please contact administrator!';
          break;
        case 422:
          String? additionalMessage;

          if(dioExc.response!.data != null) {
            additionalMessage = dioExc.response!.data!['message'];
          }

          errMessage = '(422) Invalid input request. ${additionalMessage != null ? '\n\n$additionalMessage\n\n' : ''}Please check all submitted data and try again!';
          break;
        case 500:
          errMessage = '(500) Internal server error. For more information, please contact administrator!';
          break;
        case 599:
          errMessage = "(599) Unknown status. Unable to access this menu because it's under maintenance. For more information, please contact administrator!";
          break;
        default:
          errMessage = '${dioExc.response!.statusCode != null ? "(${dioExc.response!.statusCode!}) " : ""}Unknown error. For more information, please contact administrator!';
          break;
      }

      OkDialog(
        context: context,
        content: errMessage,
        headIcon: false,
        okPressed: () async {
          if(errCode == 401) {
            if(isLoginForm == null || isLoginForm == false) {
              await LocalSharedPreferences.removeAllKey().then((deleteResult) {
                if(deleteResult == true) {
                  RedirectTo(
                    context: context,
                    target: const SplashPage(),
                  ).go();
                }
              });
            }
          }
        },
      ).show();
    }
  }
}