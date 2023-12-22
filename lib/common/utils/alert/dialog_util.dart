import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/service/navigate_service.dart';
import 'package:target_sistemas_prova_flutter/common/utils/alert/app_alert.dart';
import 'package:target_sistemas_prova_flutter/common/utils/global_services.dart';

abstract class AppDialog {
  void show({required Widget child, bool isDismissible});

  void showAlert({
    BuildContext? context,
    Color? titleColor,
    required String message,
    Color? messageColor,
    TextAlign? textAlign = TextAlign.center,
    AlertType? alertType = AlertType.ok,
    Function()? dialogCallbackYES,
    String textYesButton = 'Sim',
    String textNoButton = 'Não',
    Function()? dialogCallbackNO,
    Function? closed,
    bool barrierDismissible = true,
  });
}

class AppDialogImpl implements AppDialog {
  NavigatorService navigator;
  AppDialogImpl(this.navigator);

  @override
  void show({required Widget child, bool isDismissible = true}) {
    showDialog(
      context: _context,
      useSafeArea: true,
      barrierDismissible: isDismissible,
      barrierColor: Colors.grey.withOpacity(0.8),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          clipBehavior: Clip.hardEdge,
          child: child,
        );
      },
    );
  }

  BuildContext get _context {
    return appNavigator.navigatorKey.currentContext!;
  }

  @override
  void showAlert(
      {String title = 'Target Sistemas',
      BuildContext? context,
      Color? titleColor,
      required String message,
      Color? messageColor,
      TextAlign? textAlign = TextAlign.center,
      AlertType? alertType = AlertType.ok,
      Function()? dialogCallbackYES,
      String textYesButton = 'Sim',
      String textNoButton = 'Não',
      Function()? dialogCallbackNO,
      Function? closed,
      bool barrierDismissible = true}) {
    try {
      FocusScope.of(_context).unfocus();
      var alert = showDialog(
        context: _context,
        builder: (BuildContext x) => AppAlert(
          message: message,
          textAlign: textAlign,
          title: title,
          alertType: alertType,
          titleColor: titleColor,
          messageColor: messageColor,
          dialogCallbackYES: dialogCallbackYES,
          dialogCallbackNO: dialogCallbackNO,
          textYesButton: textYesButton,
          textNoButton: textNoButton,
        ),
        barrierDismissible: barrierDismissible,
      );

      alert.then((value) {
        print("alertController: $value");
        if (closed != null) {
          closed();
        }
      });
    } catch (e) {
      print('showAlert => invalid context');
    }
  }
}
