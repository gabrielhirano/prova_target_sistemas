import 'package:flutter/material.dart';
import 'package:target_sistemas_prova_flutter/common/utils/alert/app_alert.dart';

class AppDialog {
  final BuildContext context;
  AppDialog(this.context);

  void show({required Widget child, bool isDismissible = true}) {
    showDialog(
      context: context,
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

  void showAlert(
      {String title = 'Target Sistemas',
      // BuildContext? context,
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
      FocusScope.of(context).unfocus();
      var alert = showDialog(
        context: context,
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
